import csv
import random
import datetime

# Define the parameters for data generation
num_transactions_per_day = 20
customers = ['mark', 'george', 'john', 'jessy', 'monica']
transaction_types = ['cashIn', 'cashIn', 'cashOut', 'payment', 'transfer']
max_amount = 50000
days = 365 # 1 step = 1 day
# Generate synthetic transaction data
def generate_transaction_data(num_transactions_per_day):
    transactions = []
    balances = {customer : round(random.uniform(0, max_amount), 3) for customer in customers}
    print("Starting balances: ", balances)
    for step in range(1, days+1):
        for _ in range(num_transactions_per_day):
            name_orig = random.choice(customers)
            transaction_type = random.choice(transaction_types)
            old_balance_orig = balances[name_orig]
            if transaction_type in ['cashOut', 'payment', 'transfer']:
                amount = -1 * round(random.uniform(10, min(old_balance_orig / 10, max_amount / 10)), 2)
            else:
                amount = round(random.uniform(10, max_amount / 10), 2)
            if old_balance_orig + amount < 0:
                continue
            balances[name_orig] = round(old_balance_orig + amount, 3)
            new_balance_orig = balances[name_orig]
            transaction = transaction_type + "|" + str(step) + "|" + str(step) + "|" + name_orig + "|" + str(old_balance_orig) + "|" + str(amount) + "|" + str(new_balance_orig)
            transactions.append(transaction)
    print("Ending balances: ", balances)
    return transactions

# Write the transaction data to a CSV file with '|' as a separator
def write_to_csv(transactions, filename):
    with open(filename, 'w', newline='') as file:
        writer = csv.writer(file, delimiter='|')
        for transaction in transactions:
            transaction = transaction.split('|')
            writer.writerow(transaction)


# Generate and write the data
transactions = generate_transaction_data(num_transactions_per_day)
write_to_csv(transactions, 'csv/fraud_data_5_customers.csv')