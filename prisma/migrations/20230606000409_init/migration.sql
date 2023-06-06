/*
  Warnings:

  - The `language` column on the `character` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the `dialog` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `updatedAt` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `appearance` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `armorClass` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `attackBonus` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `attributes` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cdTr` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `connections` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `equipment` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `features` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gold` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `health` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `inspiration` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `keyHability` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `personality` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `resistenceTests` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `savingThrows` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `skills` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `speed` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `spells` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `story` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `treasure` to the `character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `character` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `level` on the `character` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `age` on the `character` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `updatedAt` to the `game` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "BaseDataType" AS ENUM ('CLASS', 'RACE', 'ATTRIBUTES', 'RESISTENCETESTS', 'SKILLS', 'SPELLS', 'BACKGROUND', 'LANGUAGE');

-- DropForeignKey
ALTER TABLE "character" DROP CONSTRAINT "character_background_fkey";

-- DropForeignKey
ALTER TABLE "character" DROP CONSTRAINT "character_class_fkey";

-- DropForeignKey
ALTER TABLE "character" DROP CONSTRAINT "character_race_fkey";

-- DropForeignKey
ALTER TABLE "dialog" DROP CONSTRAINT "dialog_characterId_fkey";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "character" ADD COLUMN     "appearance" TEXT NOT NULL,
ADD COLUMN     "armorClass" INTEGER NOT NULL,
ADD COLUMN     "attackBonus" INTEGER NOT NULL,
ADD COLUMN     "attributes" JSONB NOT NULL,
ADD COLUMN     "cdTr" INTEGER NOT NULL,
ADD COLUMN     "connections" TEXT NOT NULL,
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "equipment" TEXT NOT NULL,
ADD COLUMN     "features" TEXT NOT NULL,
ADD COLUMN     "gold" INTEGER NOT NULL,
ADD COLUMN     "health" JSONB NOT NULL,
ADD COLUMN     "inspiration" INTEGER NOT NULL,
ADD COLUMN     "keyHability" TEXT NOT NULL,
ADD COLUMN     "personality" INTEGER NOT NULL,
ADD COLUMN     "resistenceTests" JSONB NOT NULL,
ADD COLUMN     "savingThrows" JSONB NOT NULL,
ADD COLUMN     "skills" JSONB NOT NULL,
ADD COLUMN     "speed" INTEGER NOT NULL,
ADD COLUMN     "spells" JSONB NOT NULL,
ADD COLUMN     "story" TEXT NOT NULL,
ADD COLUMN     "treasure" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
DROP COLUMN "level",
ADD COLUMN     "level" DOUBLE PRECISION NOT NULL,
DROP COLUMN "age",
ADD COLUMN     "age" INTEGER NOT NULL,
ALTER COLUMN "traits" SET DATA TYPE TEXT,
DROP COLUMN "language",
ADD COLUMN     "language" TEXT[];

-- AlterTable
ALTER TABLE "game" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- DropTable
DROP TABLE "dialog";

-- CreateTable
CREATE TABLE "base-data" (
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "baseDataType" "BaseDataType" NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "base-data_index_key" ON "base-data"("index");
