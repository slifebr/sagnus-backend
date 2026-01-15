import os
import re

# Base directory for the project
base_dirs = [
    r'd:\Projetos\2025\Sagnus\ddd\sagnus\sagnus-bc-corp\src\main\java',
    r'd:\Projetos\2025\Sagnus\ddd\sagnus\sagnus-api-gateway\src\main\java',
    r'd:\Projetos\2025\Sagnus\ddd\sagnus\sagnus-bc-nfe\src\main\java' # Just in case
]

# Regex to match: import com.slifesys.sagnus.corp.application.dto.<SomeCommand>;
# We want to capture the command name group(1)
pattern = re.compile(r'import com\.slifesys\.sagnus\.corp\.application\.dto\.(\w+Command);')

replacement = r'import com.slifesys.sagnus.corp.application.command.\1;'

total_files_changed = 0

for base_dir in base_dirs:
    for root, dirs, files in os.walk(base_dir):
        for file in files:
            if file.endswith(".java"):
                filepath = os.path.join(root, file)
                
                with open(filepath, 'r', encoding='utf-8') as f:
                    content = f.read()
                
                new_content, count = pattern.subn(replacement, content)
                
                if count > 0:
                    with open(filepath, 'w', encoding='utf-8') as f:
                        f.write(new_content)
                    print(f"Updated {filepath} ({count} replacements)")
                    total_files_changed += 1

print(f"Total files updated: {total_files_changed}")
