import { Body, Controller, Post } from '@nestjs/common';
import { UserService } from 'src/services/user.service';
('@nestjs/common');

@Controller('/user')
export class UserController {
  constructor(private userService: UserService) {}

  @Post('/create')
  async createUser(@Body() body: {}) {
    await this.userService.createUser(body);
  }
}
