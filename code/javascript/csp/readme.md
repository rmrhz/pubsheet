# Lambda@Edge 4 Cloudfront Security Headers

Original Source : https://sendgrid.com/blog/add-security-headers-lambdaedge-and-terraform-aws-s3-cloudfront/

## Explanation
The following were removed from the content security policy headers `img-src`, `script-src`, `style-src`, `font-src`, `connect-src`, `frame-src`, `object-src`, in favor for `default-src`. Although this method is not recommended the rationale is to allow certain policies which are not supported in other browsers such as `script-src-elem`.

Notes(2022/04/18)
Readded what was removed, didn't work.