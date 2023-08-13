-- CreateTable
CREATE TABLE "Eatery" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "cnpj" TEXT,
    "logoImage" TEXT,
    "marketingImage" TEXT,
    "reatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "upDatedAt" DATETIME NOT NULL,
    "addressId" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Items" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "image" TEXT,
    "price" DECIMAL NOT NULL,
    "isAvailable" BOOLEAN NOT NULL DEFAULT true,
    "category" TEXT NOT NULL,
    "eateryId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "upDatedAt" DATETIME NOT NULL,
    "ordersId" TEXT,
    CONSTRAINT "Items_eateryId_fkey" FOREIGN KEY ("eateryId") REFERENCES "Eatery" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "WorkInformation" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "isOpen" BOOLEAN NOT NULL,
    "openHour" INTEGER NOT NULL,
    "closeHour" INTEGER NOT NULL,
    "deliveryTime" INTEGER NOT NULL,
    "pickUpTime" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "upDatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Address" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "number" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "neighborhood" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "postalCode" TEXT NOT NULL,
    "eateryId" TEXT NOT NULL,
    CONSTRAINT "Address_eateryId_fkey" FOREIGN KEY ("eateryId") REFERENCES "Eatery" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Assessments" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "rate" INTEGER NOT NULL,
    "comment" TEXT NOT NULL,
    "eateryId" TEXT NOT NULL,
    CONSTRAINT "Assessments_eateryId_fkey" FOREIGN KEY ("eateryId") REFERENCES "Eatery" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Orders" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "custumerName" TEXT NOT NULL,
    "custumerNumber" TEXT NOT NULL,
    "paymentMethod" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "obs" TEXT NOT NULL,
    "isDelivery" BOOLEAN NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "usersId" TEXT,
    CONSTRAINT "Orders_usersId_fkey" FOREIGN KEY ("usersId") REFERENCES "Users" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Users" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "ItemsOnOrdes" (
    "itemId" TEXT NOT NULL,
    "orderId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,

    PRIMARY KEY ("itemId", "orderId"),
    CONSTRAINT "ItemsOnOrdes_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES "Items" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ItemsOnOrdes_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Orders" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Eatery_email_key" ON "Eatery"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Address_eateryId_key" ON "Address"("eateryId");

-- CreateIndex
CREATE UNIQUE INDEX "Users_email_key" ON "Users"("email");
