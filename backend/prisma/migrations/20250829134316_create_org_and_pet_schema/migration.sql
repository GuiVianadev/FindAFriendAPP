-- CreateEnum
CREATE TYPE "public"."Age" AS ENUM ('FILHOTE', 'ADULTO', 'IDOSO');

-- CreateEnum
CREATE TYPE "public"."Size" AS ENUM ('PEQUENO', 'MEDIO', 'GRANDE');

-- CreateEnum
CREATE TYPE "public"."EnergyLevel" AS ENUM ('BAIXO', 'MEDIO', 'ALTO');

-- CreateEnum
CREATE TYPE "public"."DependencyLevel" AS ENUM ('BAIXO', 'MEDIO', 'ALTO');

-- CreateEnum
CREATE TYPE "public"."Environment" AS ENUM ('AMPLO', 'PEQUENO', 'INTERNO', 'EXTERNO');

-- CreateTable
CREATE TABLE "public"."orgs" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "whatsapp" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "cep" TEXT NOT NULL,
    "address" TEXT NOT NULL,

    CONSTRAINT "orgs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."pets" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "about" TEXT NOT NULL,
    "age" "public"."Age" NOT NULL,
    "size" "public"."Size" NOT NULL,
    "energy_level" "public"."EnergyLevel" NOT NULL,
    "dependency_level" "public"."DependencyLevel" NOT NULL,
    "environment" "public"."Environment" NOT NULL,
    "photos" TEXT[],
    "requirements" TEXT[],
    "org_id" TEXT NOT NULL,

    CONSTRAINT "pets_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "orgs_email_key" ON "public"."orgs"("email");

-- AddForeignKey
ALTER TABLE "public"."pets" ADD CONSTRAINT "pets_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "public"."orgs"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
