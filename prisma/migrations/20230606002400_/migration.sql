/*
  Warnings:

  - The values [ATTRIBUTES,RESISTENCETESTS,SKILLS,SPELLS] on the enum `BaseDataType` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "BaseDataType_new" AS ENUM ('CLASS', 'RACE', 'ATTRIBUTE', 'RESISTENCETEST', 'SKILL', 'SPELL', 'BACKGROUND', 'LANGUAGE');
ALTER TABLE "base-data" ALTER COLUMN "baseDataType" TYPE "BaseDataType_new" USING ("baseDataType"::text::"BaseDataType_new");
ALTER TYPE "BaseDataType" RENAME TO "BaseDataType_old";
ALTER TYPE "BaseDataType_new" RENAME TO "BaseDataType";
DROP TYPE "BaseDataType_old";
COMMIT;
