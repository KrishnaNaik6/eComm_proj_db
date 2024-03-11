-- CreateTable
CREATE TABLE "User" (
    "u_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "seller" (
    "seller_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "ph_no" TEXT NOT NULL,
    "business_name" TEXT NOT NULL,
    "business_address" TEXT NOT NULL,
    "product_id" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Product" (
    "prod_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "brancd" TEXT NOT NULL,
    "images" TEXT NOT NULL,
    "stock" INTEGER NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL
);

-- CreateTable
CREATE TABLE "Cart" (
    "cart_id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "cartItem" (
    "item_id" SERIAL NOT NULL,
    "Product_id" INTEGER NOT NULL,
    "cartid" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Order" (
    "Ord_id" SERIAL NOT NULL,
    "prod_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Payment" (
    "pay_id" SERIAL NOT NULL,
    "order_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Wishlist" (
    "wish_id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "WishlistItem" (
    "wishl_id" SERIAL NOT NULL,
    "wish_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_u_id_key" ON "User"("u_id");

-- CreateIndex
CREATE UNIQUE INDEX "seller_seller_id_key" ON "seller"("seller_id");

-- CreateIndex
CREATE UNIQUE INDEX "Product_prod_id_key" ON "Product"("prod_id");

-- CreateIndex
CREATE UNIQUE INDEX "Cart_cart_id_key" ON "Cart"("cart_id");

-- CreateIndex
CREATE UNIQUE INDEX "cartItem_item_id_key" ON "cartItem"("item_id");

-- CreateIndex
CREATE UNIQUE INDEX "Order_Ord_id_key" ON "Order"("Ord_id");

-- CreateIndex
CREATE UNIQUE INDEX "Payment_pay_id_key" ON "Payment"("pay_id");

-- CreateIndex
CREATE UNIQUE INDEX "Wishlist_wish_id_key" ON "Wishlist"("wish_id");

-- CreateIndex
CREATE UNIQUE INDEX "WishlistItem_wishl_id_key" ON "WishlistItem"("wishl_id");

-- AddForeignKey
ALTER TABLE "seller" ADD CONSTRAINT "seller_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("prod_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cart" ADD CONSTRAINT "Cart_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("u_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cartItem" ADD CONSTRAINT "cartItem_Product_id_fkey" FOREIGN KEY ("Product_id") REFERENCES "Product"("prod_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cartItem" ADD CONSTRAINT "cartItem_cartid_fkey" FOREIGN KEY ("cartid") REFERENCES "Cart"("cart_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_prod_id_fkey" FOREIGN KEY ("prod_id") REFERENCES "Product"("prod_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("u_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payment" ADD CONSTRAINT "Payment_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "Order"("Ord_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payment" ADD CONSTRAINT "Payment_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("u_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Wishlist" ADD CONSTRAINT "Wishlist_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("u_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WishlistItem" ADD CONSTRAINT "WishlistItem_wish_id_fkey" FOREIGN KEY ("wish_id") REFERENCES "Wishlist"("wish_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WishlistItem" ADD CONSTRAINT "WishlistItem_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("prod_id") ON DELETE RESTRICT ON UPDATE CASCADE;
