import sys
import re

def main():
    if len(sys.argv) != 3:
        print("Usage: python u23596351.py <input_file> <word>")
        sys.exit(1)

    input_file = sys.argv[1]
    word = sys.argv[2].lower()

    try:
        with open(input_file, 'r') as f:
            lines = f.readlines()
    except FileNotFoundError:
        print(f"Error: File '{input_file}' not found.")
        sys.exit(1)

    results = []

    for line in lines:
        line = line.strip()
        if not line:
            continue

        # Match student number and full name using a regular expression
        match = re.match(r'^(\d+),\s+(.+)$', line)
        if not match:
            continue

        student_number = int(match.group(1))
        full_name = match.group(2)

        # Extract the last name (last whitespace-separated token)
        name_parts = full_name.split()
        last_name = name_parts[-1].lower()

        if last_name > word:
            results.append(student_number)

    if not results:
        print("None found")
    else:
        results.sort()
        for num in results:
            print(num)

if __name__ == "__main__":
    main()