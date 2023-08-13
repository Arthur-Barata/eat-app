import { Module } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { PrismaService } from './user-repository/database.service';
import { UserRepository } from './user-repository/user.repository';

@Module({
  providers: [PrismaService, PrismaClient, UserRepository],
  exports: [PrismaService, PrismaClient, UserRepository],
})
export class DatabaseModule {}
