const target = document.getElementById("target");

async function getData() {
    const envResponse = await fetch("./env.json");
    const envJson = await envResponse.json();
    const url = envJson.URL_BACK;
    const options = {
        method: "get"
    }
    const response = await fetch(url + "users", options);
    const data = await response.json();
    target.innerHTML = data[0].name + " " + data[1].name + " " + data[2].name;
    console.log(data);
}