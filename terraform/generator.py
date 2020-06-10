import time
import json
import boto3
import random
from datetime import datetime
from faker import Faker

faker = Faker('pt_BR)
my_stream_name = 'events'

kinesis_client = boto3.client('kinesis', region_name='us-east-1')

while True:
	time.sleep(5)
	for i in range(1,50):
		cliente = fake.simple_profile()
		cliente['created_at'] = str(datetime.now().replace(microsecond=0).isoformat())
		print(cliente)
		put_response = kinesis_client.put_record(
				StreamName=my_Stream_name,
				Data=json.dump(client),
				PartitionKey=str(random.randint(1,5)))