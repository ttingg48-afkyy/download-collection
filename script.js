function openMenu() {
    document.getElementById("menu").style.display = "flex";
}

function closeMenu() {
    document.getElementById("menu").style.display = "none";
}

function setTab(tab) {

    // Reset titik
    document.getElementById("dot-semua").classList.add("hidden");
    document.getElementById("dot-camera").classList.add("hidden");
    document.getElementById("dot-game").classList.add("hidden");

    let content = document.getElementById("content");

    // TAB SEMUA
    if (tab === "semua") {
        document.getElementById("dot-semua").classList.remove("hidden");
        content.innerHTML = `
        <div class="menu-item" onclick="downloadBarlens()">
            <img src="logo.png" class="menu-img">
            <p>BarLens • Camera</p>
        </div>

        <div class="menu-item" onclick="downloadBarcam()">
            <img src="barcam.png" class="menu-img">
            <p>BarCam • Camera</p>
        </div>`;
    }

    // TAB CAMERA
    if (tab === "camera") {
        document.getElementById("dot-camera").classList.remove("hidden");
        content.innerHTML = `
        <div class="menu-item" onclick="downloadBarlens()">
            <img src="logo.png" class="menu-img">
            <p>BarLens • Camera</p>
        </div>

        <div class="menu-item" onclick="downloadBarcam()">
            <img src="barcam.png" class="menu-img">
            <p>BarCam • Camera</p>
        </div>`;
    }

    // TAB GAME
    if (tab === "game") {
        document.getElementById("dot-game").classList.remove("hidden");
        content.innerHTML = `<p class="center">Coming soon</p>`;
    }
}

// =============================
// DOWNLOAD
// =============================
function downloadBarlens() {
    window.location.href = "https://yourlink.com/barlens.apk";
}

function downloadBarcam() {
    window.location.href = "https://yourlink.com/barcam.apk";
}