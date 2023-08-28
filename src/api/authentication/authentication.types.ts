export class User {
  iUserId?: number;
  vFirstName!: string;
  vLastName!: string;
  vEmail!: string;
  vPassword!: string;
  vConfirmPassword!: string;
  dtUpdatedAt!: Date;
  dtCreatedAt!: Date;

  constructor(data?: Partial<User>) {
    data && Object.assign(this, data);
  }
}
