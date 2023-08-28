export class User {
  iUserId!: number;
  vFirstName!: string;
  vLastName!: string;
  vEmail!: string;
  vPassword!: string;
  dtUpdatedAt!: string;
  dtCreatedAt!: string;
  iPostCount!: number;

  constructor(data?: Partial<User>) {
    data && Object.assign(this, data);
  }
}
