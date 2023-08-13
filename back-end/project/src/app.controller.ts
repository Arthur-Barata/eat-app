import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
import { UserRepository } from './database/user-repository/user.repository';

@Controller()
export class AppController {
  constructor(
    private readonly appService: AppService,
    private userRepository: UserRepository,
  ) {}

  @Get()
  getHello(): void {
    this.userRepository.createUSer();
  }
}
