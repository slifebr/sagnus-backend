import os

# Map of old partial import -> new fully qualified import
replacements = {
    # Agenda
    "import com.slifesys.sagnus.adm.domain.model.CategoriaCompromisso;": "import com.slifesys.sagnus.adm.domain.model.agenda.CategoriaCompromisso;",
    "import com.slifesys.sagnus.adm.domain.model.Compromisso;": "import com.slifesys.sagnus.adm.domain.model.agenda.Compromisso;",
    "import com.slifesys.sagnus.adm.domain.model.Convite;": "import com.slifesys.sagnus.adm.domain.model.agenda.Convite;",
    "import com.slifesys.sagnus.adm.domain.model.Notificacao;": "import com.slifesys.sagnus.adm.domain.model.agenda.Notificacao;",
    
    # Modulo
    "import com.slifesys.sagnus.adm.domain.model.Modulo;": "import com.slifesys.sagnus.adm.domain.model.modulo.Modulo;",
    "import com.slifesys.sagnus.adm.domain.model.ModuloId;": "import com.slifesys.sagnus.adm.domain.model.modulo.ModuloId;",

    # Empresa
    "import com.slifesys.sagnus.adm.domain.model.Empresa;": "import com.slifesys.sagnus.adm.domain.model.empresa.Empresa;",
    "import com.slifesys.sagnus.adm.domain.model.Filial;": "import com.slifesys.sagnus.adm.domain.model.empresa.Filial;",

    # Parametro (RENAME)
    "import com.slifesys.sagnus.adm.domain.model.Parametro;": "import com.slifesys.sagnus.adm.domain.model.parametro.ParametroSistema;",
    
    # Audit
    "import com.slifesys.sagnus.adm.domain.model.Audit;": "import com.slifesys.sagnus.adm.domain.model.audit.Audit;",

    # Usuario
    "import com.slifesys.sagnus.adm.domain.model.Usuario;": "import com.slifesys.sagnus.adm.domain.model.usuario.Usuario;",
    "import com.slifesys.sagnus.adm.domain.model.usuario.Perfil;": "import com.slifesys.sagnus.adm.domain.model.usuario.Perfil;",
    "import com.slifesys.sagnus.adm.domain.model.Perfil;": "import com.slifesys.sagnus.adm.domain.model.usuario.Perfil;",
    "import com.slifesys.sagnus.adm.domain.model.Permissao;": "import com.slifesys.sagnus.adm.domain.model.usuario.Permissao;"
}

base_dir = r"d:\Projetos\2025\Sagnus\ddd\sagnus\sagnus-bc-adm\src\main\java"

for root, dirs, files in os.walk(base_dir):
    for file in files:
        if file.endswith(".java"):
            filepath = os.path.join(root, file)
            with open(filepath, 'r', encoding='utf-8') as f:
                content = f.read()
            
            original_content = content
            
            # 1. Imports
            for old, new in replacements.items():
                content = content.replace(old, new)
            
            # 2. Parametro Rename Logic
            # Be precise to avoid replacing "ParametroInput" -> "ParametroSistemaInput" (unless desired, but likely not yet)
            # Replacing "Parametro " -> "ParametroSistema " (variable declaration)
            # Replacing "<Parametro>" -> "<ParametroSistema>" (Generics)
            # Replacing "Parametro." -> "ParametroSistema." (Static access)
            # Excluding "ParametroInput", "ParametroResult"
            
            content = content.replace("Parametro ", "ParametroSistema ")
            content = content.replace("<Parametro>", "<ParametroSistema>")
            content = content.replace("Parametro.", "ParametroSistema.")
            content = content.replace("(Parametro)", "(ParametroSistema)") 
            
            # Fix accidental double replace or wrong replacements if any
            content = content.replace("ParametroSistemaInput", "ParametroInput")
            content = content.replace("ParametroSistemaResult", "ParametroResult")
            content = content.replace("ParametroSistemaRepository", "ParametroRepository") # Usually repos might need rename too, but let's check
            
            # Fix CreateCompromissoUseCase issue
            content = content.replace("package com.slifesys.sagnus.adm.domain.model;", "")


            if content != original_content:
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(content)
                print(f"Updated {filepath}")
