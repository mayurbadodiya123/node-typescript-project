class UploadFilesService {
  constructor() {}

  uploadFile(file: any) {
    console.log("Filessss", file);
    const myfiles = JSON.parse(JSON.stringify(file));
    const files = myfiles.map((res: any) => ({
      filename: res.filename,
      path: res.path,
    }));
    return files;
  }
}

export default UploadFilesService;
