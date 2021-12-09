/*
  Warnings:

  - You are about to alter the column `expiresIn` on the `refresh_token` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_refresh_token" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "expiresIn" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,
    CONSTRAINT "refresh_token_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_refresh_token" ("expiresIn", "id", "userId") SELECT "expiresIn", "id", "userId" FROM "refresh_token";
DROP TABLE "refresh_token";
ALTER TABLE "new_refresh_token" RENAME TO "refresh_token";
CREATE UNIQUE INDEX "refresh_token_userId_key" ON "refresh_token"("userId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
