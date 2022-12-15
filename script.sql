-- Table Definition
CREATE TABLE "public"."MqttAcls" (
    "id" uuid NOT NULL,
    "topic" varchar(255),
    "rw" int4 DEFAULT 0,
    "userId" uuid,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    PRIMARY KEY ("id")
);

-- Table Definition
CREATE TABLE "public"."MqttUsers" (
    "id" uuid NOT NULL,
    "userName" varchar(255) NOT NULL,
    "passwordHash" varchar(255) NOT NULL,
    "isAdmin" bool NOT NULL DEFAULT true,
    "isActive" bool NOT NULL DEFAULT true,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."MqttAcls" ("id", "topic", "rw", "userId", "createdAt", "updatedAt") VALUES
('72adb797-f829-1234-a436-a0613fece724', 'topic1', 3, '72adb797-f829-1234-a436-a0613fece724', '2022-12-12 00:00:00+00', '2022-12-12 00:00:00+00');

INSERT INTO "public"."MqttUsers" ("id", "userName", "passwordHash", "isAdmin", "isActive", "createdAt", "updatedAt") VALUES
('72adb797-f829-1234-a436-a0613fece724', 'user1', '$2b$10$uEyoPdHpXvG.F1JhU7X5fO.6hiZqZNSh/nq4AwPVhR/oG70jRvSmS', 't', 't', '2022-12-06 01:11:06.292+00', '2022-12-06 01:11:06.292+00'),
('72adb797-f829-4557-a436-a0613fece724', 'admin', '$2b$10$uEyoPdHpXvG.F1JhU7X5fO.6hiZqZNSh/nq4AwPVhR/oG70jRvSmS', 't', 't', '2022-12-06 01:11:06.292+00', '2022-12-06 01:11:06.292+00');

ALTER TABLE "public"."MqttAcls" ADD FOREIGN KEY ("userId") REFERENCES "public"."MqttUsers"("id") ON UPDATE CASCADE;