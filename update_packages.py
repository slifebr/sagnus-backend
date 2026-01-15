import os

directory = r'd:\Projetos\2025\Sagnus\ddd\sagnus\sagnus-bc-corp\src\main\java\com\slifesys\sagnus\corp\application\command'
old_package = 'package com.slifesys.sagnus.corp.application.dto;'
new_package = 'package com.slifesys.sagnus.corp.application.command;'

updated_count = 0
for filename in os.listdir(directory):
    if filename.endswith(".java"):
        filepath = os.path.join(directory, filename)
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        if old_package in content:
            new_content = content.replace(old_package, new_package)
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(new_content)
            print(f"Updated {filename}")
            updated_count += 1
        else:
            print(f"Skipped {filename} (package not found)")

print(f"Total updated: {updated_count}")
