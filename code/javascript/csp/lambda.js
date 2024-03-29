"use strict";
const path = require("path");

const formSpaceSeparatedList = (list) => list.join(" ");

const scriptSrcAllowlist = [

];
const generateScriptSrcPolicy = () => {
  return `'self' ${formSpaceSeparatedList(scriptSrcAllowlist)}`;
};

const styleSrcAllowlist = [

];
const generateStyleSrcPolicy = () => {
  return `'self' ${formSpaceSeparatedList(styleSrcAllowlist)}`;
};

const fontSrcAllowlist = [

];
const generateFontSrcPolicy = () => {
  return `'self' ${formSpaceSeparatedList(fontSrcAllowlist)}`;
};

const connectSrcAllowlist = [

];
const generateConnectSrcPolicy = () => {
  return `'self' ${formSpaceSeparatedList(connectSrcAllowlist)}`;
};

const frameSrcAllowlist = [

];
const generateFrameSrcPolicy = () => {
  return `'self' ${formSpaceSeparatedList(frameSrcAllowlist)}`;
};

const imageSrcAllowlist = [
  
];

const generateImageSrcPolicy = () => {
  return `'self' ${formSpaceSeparatedList(imageSrcAllowlist)}`;
};

exports.handler = (event, context, callback) => { 
  const response = event.Records[0].cf.response;
  const headers = response.headers;

  headers["strict-transport-security"] = [
    {
      key: "Strict-Transport-Security",
      value: "max-age=63072000; includeSubdomains; preload",
    },
  ];
  headers["content-security-policy"] = [
    {
      key: "Content-Security-Policy",
      value: `default-src 'self'; img-src ${generateImageSrcPolicy()}; script-src ${generateScriptSrcPolicy()}; style-src ${generateStyleSrcPolicy()}; font-src ${generateFontSrcPolicy()}; connect-src ${generateConnectSrcPolicy()}; frame-src ${generateFrameSrcPolicy()}; object-src 'none';`,
    },
  ];
  headers["x-content-type-options"] = [
    { key: "X-Content-Type-Options", value: "nosniff" },
  ];
  headers["x-frame-options"] = [{ key: "X-Frame-Options", value: "DENY" }];
  headers["x-xss-protection"] = [
    { key: "X-XSS-Protection", value: "1; mode=block" },
  ];
  headers["referrer-policy"] = [
    { key: "Referrer-Policy", value: "same-origin" },
  ];

  callback(null, response);
};
