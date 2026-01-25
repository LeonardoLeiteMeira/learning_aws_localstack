import json
import sys

from main import lambda_handler


def main():
    event_path = sys.argv[1] if len(sys.argv) > 1 else None
    event = json.load(open(event_path)) if event_path else {}
    result = lambda_handler(event, None)
    print(result)


if __name__ == "__main__":
    main()
