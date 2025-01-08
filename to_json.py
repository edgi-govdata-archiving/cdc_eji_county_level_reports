import csv
import json


def read_fips_codes():
    with open("US_FIPS_Codes.tsv") as file:
        reader = csv.reader(file, delimiter="\t")
        return [row for row in reader]


def generate_json_from_fips():
    fips_codes = read_fips_codes()
    with open("US_FIPS_Codes.json", "w") as json_file:
        json.dump(fips_codes, json_file, indent=4)


if __name__ == "__main__":
    generate_json_from_fips()
