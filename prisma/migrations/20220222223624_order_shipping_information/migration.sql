/*
  Warnings:

  - You are about to drop the column `bio` on the `Account` table. All the data in the column will be lost.
  - Added the required column `profile` to the `Account` table without a default value. This is not possible if the table is not empty.
  - Added the required column `addressId` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `price` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `shippingEmail` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `shippingName` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `shippingPhone` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `retail_price` to the `OrderItem` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Account" DROP COLUMN "bio",
ADD COLUMN     "profile" JSONB NOT NULL,
ADD COLUMN     "wallet" TEXT;

-- AlterTable
ALTER TABLE "Configuration" ALTER COLUMN "version" DROP NOT NULL,
ALTER COLUMN "version" DROP DEFAULT;

-- AlterTable
ALTER TABLE "Order" ADD COLUMN     "addressId" INTEGER NOT NULL,
ADD COLUMN     "phoneId" INTEGER,
ADD COLUMN     "price" DECIMAL(65,30) NOT NULL,
ADD COLUMN     "shippingEmail" TEXT NOT NULL,
ADD COLUMN     "shippingName" TEXT NOT NULL,
ADD COLUMN     "shippingPhone" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "OrderItem" ADD COLUMN     "retail_price" DECIMAL(65,30) NOT NULL,
ADD COLUMN     "sku" TEXT;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES "Address"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_phoneId_fkey" FOREIGN KEY ("phoneId") REFERENCES "Phone"("id") ON DELETE SET NULL ON UPDATE CASCADE;
