import sys
import argparse

# コマンドに対応するコールバック関数を登録する辞書
COMMAND_CALLBACKS = {}

# コマンドに対応するコールバック関数を登録する関数
def register_command_callback(command, callback):
    COMMAND_CALLBACKS[command] = callback

# コマンドに対応するコールバック関数を登録
def command1_callback(options):
    print(f"Command1 called with options: {options}")

def command2_callback(options):
    print(f"Command2 called with options: {options}")

register_command_callback("command1", command1_callback)
register_command_callback("command2", command2_callback)
# コマンドとオプションの入力を解析してコマンドの実行
def parse_and_execute_command_input(input_str):
    parser = argparse.ArgumentParser(prog=input_str.split()[0])
    parser.add_argument("command")
    parser.add_argument("options", nargs="*")
    args = parser.parse_args(input_str.split()[1:])
    command = args.command
    options = args.options
    callback = COMMAND_CALLBACKS.get(command)
    if callback:
        callback(options)
    else:
        print(f"Invalid command: {command}")

# コマンドの実行
while True:
    try:
        input_str = input("Enter command: ")
        parse_and_execute_command_input(input_str)
    except KeyboardInterrupt:
        sys.exit(0)
        