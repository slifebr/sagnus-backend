-- Usuário admin (senha: Admin@123)
-- Gere seu próprio hash se preferir:
--   new BCryptPasswordEncoder().encode("Admin@123")

INSERT INTO auth_usuario (
    username,
	email,
    senha_hash,
    ativo,
    role,
    pessoa_id,
    criado_em,
	usu_criacao,
	atualizado_em
) VALUES (
    'admin',
	'admin@slifesys.com',
    '$2a$10$7r1R0m1gF5Q7c5KpXz8e0e0pQKp3dZJ1XGz5z7YzV5P0g9y4bQw6u',
    true,
    'ROLE_AUTH_ADMIN',
    NULL,
    NOW(),
    user,
	now()
);