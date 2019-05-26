const converter = require('oas-raml-converter');
const fs = require('fs');

const conversion = new converter.Converter(converter.Formats.RAML, converter.Formats.OAS30);

conversion.convertFile('api.raml').then(function (oas3) {
    fs.writeFile('./build/api.oas3.json', JSON.stringify(oas3), function(err) {
        if(err) {
            return console.log(err);
        }

        console.log("The file was saved!");
    });
}).catch(function (err) {
    console.error(err);
});