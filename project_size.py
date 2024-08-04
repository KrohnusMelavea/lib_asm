import os

src_file_paths = [f"{path}\\{file}" for path, _, files in os.walk("src") for file in files if file.endswith(".asm")]
tests_file_paths = [f"{path}\\{file}" for path, _, files in os.walk("tests") for file in files if file.endswith(".asm")]

print("src:")
src_line_count = 0
src_char_count = 0
for file_path in src_file_paths:
    with open(file_path, "r") as file_handler:
        file_contents = file_handler.read()
        line_count = file_contents.count('\n')
        char_count = len(file_contents)
        src_line_count += line_count
        src_char_count += char_count
        print(f"- {file_path}: {line_count} lines, {char_count} chars")

print("\n"*3)

print("tests:")
tests_line_count = 0
tests_char_count = 0
for file_path in tests_file_paths:
    with open(file_path, "r") as file_handler:
        file_contents = file_handler.read()
        line_count = file_contents.count('\n')
        char_count = len(file_contents)
        tests_line_count += line_count
        tests_char_count += char_count
        print(f"- {file_path}: {line_count} lines, {char_count} chars")

print("\n"*3)

print(f"src total: {src_line_count} lines, {src_char_count} chars")
print(f"tests total: {tests_line_count} lines, {tests_char_count} chars")
