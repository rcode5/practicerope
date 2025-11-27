import Uppy from "@uppy/core";
import AwsS3 from "@uppy/aws-s3";
import DragDrop from "@uppy/drag-drop";

import "@uppy/core/css/style.min.css";
import "@uppy/drag-drop/css/style.min.css";

const uppyClient = ({ target, endpoint }) => {
  return new Uppy({
    maxNumberOfFiles: 1,
    allowedFileTypes: ["audio/*"],
  })
    .use(AwsS3, { endpoint })
    .use(DragDrop, { target });
};

const setupFileUploader = (target) => {
  const uppy = uppyClient({
    target,
    endpoint: "/file-upload",
  });
  uppy.onDrop(() => {
    console.log("dropped", arguments);
  });
};

// const id = uppy.addFile(/* ... */);

// await uppy.upload();

// const body = uppy.getFile(id).response.body!;
// const { location } = body; // This is now type safe

export { setupFileUploader };
