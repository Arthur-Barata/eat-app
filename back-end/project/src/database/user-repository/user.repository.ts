import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from './database.service';
@Injectable()
export class UserRepository {
  constructor(private prisma: PrismaService) {}

  async createUSer(body: Users): Promise<Users> {
    const { email, name, password } = body;
    return await this.prisma.users.create({
      data: {
        email,
        name,
        password,
      },
    });
  }
  async updateUser() {}
}

export type Users = Prisma.UsersGetPayload<typeof Users>;

const Users = Prisma.validator<Prisma.UsersArgs>()({
  select: {
    name: true,
    email: true,
    password: true,
  },
});
