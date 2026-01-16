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

    # Parametro
    "import com.slifesys.sagnus.adm.domain.model.Parametro;": "import com.slifesys.sagnus.adm.domain.model.parametro.ParametroSistema;", # Rename if necessary
    
    # Audit
    "import com.slifesys.sagnus.adm.domain.model.Audit;": "import com.slifesys.sagnus.adm.domain.model.audit.Audit;",

    # Usuario
    "import com.slifesys.sagnus.adm.domain.model.Usuario;": "import com.slifesys.sagnus.adm.domain.model.usuario.Usuario;",
    "import com.slifesys.sagnus.adm.domain.model.usuario.Perfil;": "import com.slifesys.sagnus.adm.domain.model.usuario.Perfil;", # Already correct usually, but ensure no old references
    "import com.slifesys.sagnus.adm.domain.model.Perfil;": "import com.slifesys.sagnus.adm.domain.model.usuario.Perfil;",
    "import com.slifesys.sagnus.adm.domain.model.Permissao;": "import com.slifesys.sagnus.adm.domain.model.usuario.Permissao;"
}

# Parametro special case: renaming Parametro to ParametroSistema usage
parametro_regex = [
    ("Parametro ", "ParametroSistema "),
    ("Parametro.", "ParametroSistema."),
    ("<Parametro>", "<ParametroSistema>")
]

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
            
            # 2. Parametro Rename Logic (simple string replace)
            if "Parametro" in content and "ParametroSistema" not in content and "ParametroResultado" not in content:
                 # Be careful not to replace ParametroInput etc.
                 # This is risky, but compilation check will catch it.
                 pass 

            if content != original_content:
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(content)
                print(f"Updated {filepath}")
