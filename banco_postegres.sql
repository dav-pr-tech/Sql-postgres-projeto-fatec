
CREATE SEQUENCE tipo_documento_id_seq;

CREATE TABLE tipo_documento (
                id BIGINT NOT NULL DEFAULT nextval('tipo_documento_id_seq'),
                nome_documento VARCHAR,
                CONSTRAINT tipo_documento_pk PRIMARY KEY (id)
);


ALTER SEQUENCE tipo_documento_id_seq OWNED BY tipo_documento.id;

CREATE SEQUENCE cadastro_empresa_id_seq;

CREATE TABLE cadastro_empresa (
                id BIGINT NOT NULL DEFAULT nextval('cadastro_empresa_id_seq'),
                razao_social VARCHAR(300),
                status_sistema VARCHAR,
                cnpj VARCHAR(150),
                data_cadastro DATE NOT NULL,
                telefone VARCHAR,
                email VARCHAR(200),
                endereco VARCHAR(250),
                contato VARCHAR(150),
                CONSTRAINT cadastro_empresa_pk PRIMARY KEY (id)
);


ALTER SEQUENCE cadastro_empresa_id_seq OWNED BY cadastro_empresa.id;

CREATE SEQUENCE aluno_id_seq;

CREATE TABLE aluno (
                id BIGINT NOT NULL DEFAULT nextval('aluno_id_seq'),
                ra VARCHAR NOT NULL,
                curso VARCHAR,
                nome_aluno VARCHAR(200) NOT NULL,
                CONSTRAINT aluno_pk PRIMARY KEY (id)
);


ALTER SEQUENCE aluno_id_seq OWNED BY aluno.id;

CREATE TABLE equivalencias (
                id_equivalencia BIGINT NOT NULL,
                documentacao_da_empresa VARCHAR(100) NOT NULL,
                documentacao_da_equivalencia VARCHAR(100) NOT NULL,
                observacao VARCHAR(100) NOT NULL,
                id_aluno BIGINT NOT NULL,
                CONSTRAINT equivalencias_pk PRIMARY KEY (id_equivalencia)
);


CREATE SEQUENCE estagios_id_seq;

CREATE TABLE estagios (
                id_estagios BIGINT NOT NULL DEFAULT nextval('estagios_id_seq'),
                semestre VARCHAR(100),
                data_final DATE NOT NULL,
                ano_do_estagio DATE,
                data_cadastro VARCHAR NOT NULL,
                data_inicial DATE NOT NULL,
                agente_Integrador VARCHAR(100),
                obrigatorio VARCHAR(10),
                id_tipo_documento BIGINT NOT NULL,
                id_aluno BIGINT NOT NULL,
                id_cadastro_empresa BIGINT NOT NULL,
                CONSTRAINT estagios_pk PRIMARY KEY (id_estagios)
);


ALTER SEQUENCE estagios_id_seq OWNED BY estagios.id_estagios;

CREATE SEQUENCE relatorios_entregues_id_seq;

CREATE TABLE relatorios_entregues (
                id BIGINT NOT NULL DEFAULT nextval('relatorios_entregues_id_seq'),
                relatorio VARCHAR,
                situacao VARCHAR(100),
                id_estagios BIGINT NOT NULL,
                CONSTRAINT relatorios_entregues_pk PRIMARY KEY (id)
);


ALTER SEQUENCE relatorios_entregues_id_seq OWNED BY relatorios_entregues.id;

ALTER TABLE estagios ADD CONSTRAINT tipo_documento_estagios_fk
FOREIGN KEY (id_tipo_documento)
REFERENCES tipo_documento (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE estagios ADD CONSTRAINT cadastro_empresa_estagios_fk
FOREIGN KEY (id_cadastro_empresa)
REFERENCES cadastro_empresa (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE estagios ADD CONSTRAINT aluno_estagios_fk
FOREIGN KEY (id_aluno)
REFERENCES aluno (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE equivalencias ADD CONSTRAINT aluno_equivalencias_fk
FOREIGN KEY (id_aluno)
REFERENCES aluno (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE relatorios_entregues ADD CONSTRAINT estagios_relatorios_entregues_fk
FOREIGN KEY (id_estagios)
REFERENCES estagios (id_estagios)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
