import { Injectable } from '@nestjs/common';
import { UserRepository } from 'src/database/user-repository/user.repository';

@Injectable()
export class UserService {
  constructor(private userRepository: UserRepository) {}

  async createUser(body) {
    return await this.userRepository.createUSer();
  }
}
