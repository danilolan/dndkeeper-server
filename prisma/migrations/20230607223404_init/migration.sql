-- CreateEnum
CREATE TYPE "BaseDataType" AS ENUM ('CLASS', 'RACE', 'ATTRIBUTE', 'RESISTENCETEST', 'SKILL', 'SPELL', 'BACKGROUND', 'LANGUAGE');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "game" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "url" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "character" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "race" TEXT NOT NULL,
    "level" DOUBLE PRECISION NOT NULL,
    "age" INTEGER NOT NULL,
    "attributes" JSONB NOT NULL,
    "resistenceTests" JSONB NOT NULL,
    "keyHability" TEXT NOT NULL,
    "cdTr" INTEGER NOT NULL,
    "attackBonus" INTEGER NOT NULL,
    "features" TEXT NOT NULL,
    "savingThrows" JSONB NOT NULL,
    "skills" JSONB NOT NULL,
    "health" JSONB NOT NULL,
    "armorClass" INTEGER NOT NULL,
    "speed" INTEGER NOT NULL,
    "inspiration" INTEGER NOT NULL,
    "gold" INTEGER NOT NULL,
    "spells" JSONB NOT NULL,
    "background" TEXT NOT NULL,
    "personality" INTEGER NOT NULL,
    "ideals" INTEGER NOT NULL,
    "bonds" INTEGER NOT NULL,
    "flaws" INTEGER NOT NULL,
    "language" TEXT[],
    "appearance" TEXT NOT NULL,
    "connections" TEXT NOT NULL,
    "story" TEXT NOT NULL,
    "traits" TEXT NOT NULL,
    "equipment" TEXT NOT NULL,
    "treasure" TEXT NOT NULL,
    "gameId" TEXT NOT NULL,
    "userId" TEXT
);

-- CreateTable
CREATE TABLE "base-data" (
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "baseDataType" "BaseDataType" NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_id_key" ON "User"("id");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "game_id_key" ON "game"("id");

-- CreateIndex
CREATE UNIQUE INDEX "character_id_key" ON "character"("id");

-- CreateIndex
CREATE UNIQUE INDEX "base-data_index_key" ON "base-data"("index");

-- AddForeignKey
ALTER TABLE "character" ADD CONSTRAINT "character_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "game"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "character" ADD CONSTRAINT "character_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
