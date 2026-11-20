@description('Who gets the email. Given on the command line, so it is not in the repo.')
param contactEmail string

@description('Kronor for the whole course. Half of the 500 kr, so the other half is left for the project.')
param amount int = 250

resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'budget-early-warning'
  properties: {
    category: 'Cost'
    amount: amount
    timeGrain: 'Annually'
    timePeriod: {
      startDate: '2026-10-01'
      endDate: '2026-12-11'
    }
    notifications: {
      halfUsed: {
        enabled: true
        operator: 'GreaterThanOrEqualTo'
        threshold: 50
        thresholdType: 'Actual'
        contactEmails: [contactEmail]
      }
      onTrackToRunOut: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        thresholdType: 'Forecasted'
        contactEmails: [contactEmail]
      }
    }
  }
}
