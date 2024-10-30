
# Bash Replace Script

This bash script allows users to perform a find-and-replace operation across multiple files within a specified directory. With an option to execute replacements recursively in all subdirectories, the script efficiently finds and replaces target text strings in bulk.

## Features

- **Recursive Option:** Use the `-r` flag to enable replacements in subdirectories.
- **Directory Targeting:** Specify a directory for the find-and-replace operation, or default to the current directory.
- **Flexible Input:** Allows input of two target strings — one to find and the other to replace across files.
- **Summary Output:** Provides feedback on replacements made per file and a total replacement count.

## Usage

```bash
./replace.sh [-r] [directory] <something> <somethingElse>
```

- `-r` (optional): If specified, the script will search in all subdirectories.
- `directory` (optional): Directory in which the search and replace should occur. Defaults to the current directory (`.`) if not specified.
- `<something>`: The string to be replaced.
- `<somethingElse>`: The string that will replace occurrences of `<something>`.

### Example Commands

1. **Basic Find and Replace in Current Directory**  
   Replace `foo` with `bar` in all files in the current directory:
   ```bash
   ./replace.sh foo bar
   ```

2. **Find and Replace in a Specific Directory**  
   Replace `hello` with `world` in all files within the `docs` directory:
   ```bash
   ./replace.sh docs hello world
   ```

3. **Recursive Replacement**  
   Replace `old_text` with `new_text` in all files within `src` and its subdirectories:
   ```bash
   ./replace.sh -r src old_text new_text
   ```

## Requirements

- **Bash**: Ensure you have a compatible version of Bash installed (most Unix-based systems have Bash by default).

## Script Workflow

1. **Argument Parsing**: Verifies at least two arguments (`something` and `somethingElse`) are provided and checks for the optional `-r` flag.
2. **Directory Scanning**: Finds files in the specified directory (and optionally subdirectories) while excluding the script file itself.
3. **Replacement Loop**: For each file, finds and replaces all occurrences of `<something>` with `<somethingElse>`.
4. **Summary Output**: Prints the number of replacements per file and a total replacement summary.

## Notes

- The script uses `sed` for in-place replacements, compatible with most Unix/Linux systems.
- Ensure you have proper write permissions in the specified directory to allow in-place file edits.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Feel free to open issues or create pull requests to improve the script’s functionality or documentation.
