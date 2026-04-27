'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "ea7520d76743c533cb2b54c3c5d7a8c5",
"assets/AssetManifest.bin.json": "51bb4d8657fc896e087d0f8d89e5c84d",
"assets/AssetManifest.json": "968cdaf888cd3527a2e1de6837b50aa9",
"assets/Assets/projects/Advanced%2520To-Do%2520App/1.png": "a3f70224c31cb43f27e7e66c3097208c",
"assets/Assets/projects/AI%2520Smart%2520Health%2520Monitor/1.png": "527b12e81f7d84fa17667598af673f91",
"assets/Assets/projects/AI%2520Smart%2520Health%2520Monitor/2.png": "e49e7526940e2fb5dc8f649e8ccbe501",
"assets/Assets/projects/AI%2520Smart%2520Health%2520Monitor/3.png": "b6d0ccf619df02b1786c6c544e15daab",
"assets/Assets/projects/AI%2520Smart%2520Health%2520Monitor/4.png": "5f8762fccf54c6e2fc71a651ae33ef1b",
"assets/Assets/projects/AI%2520Smart%2520Health%2520Monitor/5.png": "6543709c331c8ad06b212a18cb9ac017",
"assets/Assets/projects/AI%2520Smart%2520Health%2520Monitor/6.png": "a5ac7d06d56fb9a4ff40a4a0f7a418b0",
"assets/Assets/projects/BMI%2520Calculator%2520&%2520Tracker/1.png": "9571e9c62203cdab534e263abe78829b",
"assets/Assets/projects/BMI%2520Calculator%2520&%2520Tracker/10.png": "b32585f6992ca2d09284983c195b87ba",
"assets/Assets/projects/BMI%2520Calculator%2520&%2520Tracker/2.png": "a5757d6eafea7074d58f528dedeb06df",
"assets/Assets/projects/BMI%2520Calculator%2520&%2520Tracker/3.png": "57ee9b71708f2b1d4943988b130fa728",
"assets/Assets/projects/BMI%2520Calculator%2520&%2520Tracker/4.png": "512fa8d30e9b4c334c0e7f93b2510da6",
"assets/Assets/projects/BMI%2520Calculator%2520&%2520Tracker/5.png": "c47f17189dde17e9095b3bdbaecddc9a",
"assets/Assets/projects/BMI%2520Calculator%2520&%2520Tracker/6.png": "0bee243e127cb59b6635a6d74a6de5a9",
"assets/Assets/projects/BMI%2520Calculator%2520&%2520Tracker/7.png": "bed73f6e5829a584edbf40c92352047b",
"assets/Assets/projects/BMI%2520Calculator%2520&%2520Tracker/8.png": "ea8ef9e022cd41a3714169679081041c",
"assets/Assets/projects/BMI%2520Calculator%2520&%2520Tracker/9.png": "a9a5b0a7ad256dbcef37cb047dd754fa",
"assets/Assets/projects/Car%2520Management%2520System/1.png": "64175b2ef493627b03c04fee05de9523",
"assets/Assets/projects/Car%2520Management%2520System/10.png": "0d0355effa0ff0e6733b181185e836b4",
"assets/Assets/projects/Car%2520Management%2520System/11.png": "fa58f2523996b44de21a6fab966483c8",
"assets/Assets/projects/Car%2520Management%2520System/12.png": "5f452dde485a76ee17154b41eef7e997",
"assets/Assets/projects/Car%2520Management%2520System/13.png": "4e243f926d08916149d2824dad2d74c0",
"assets/Assets/projects/Car%2520Management%2520System/14.png": "c6b6942fec10539b7df38f3c3c5d78d9",
"assets/Assets/projects/Car%2520Management%2520System/15.png": "bb00726c808dbf136e623107da84cebb",
"assets/Assets/projects/Car%2520Management%2520System/16.png": "f5ebce86af9683929c312b3827d6785c",
"assets/Assets/projects/Car%2520Management%2520System/17.png": "19af3f9a60992a6c1ecb1b42f7122db6",
"assets/Assets/projects/Car%2520Management%2520System/18.png": "8242be0a53fcd89fe30cba0c890c4abf",
"assets/Assets/projects/Car%2520Management%2520System/2.png": "983d907d421653a76bc4642f54aca771",
"assets/Assets/projects/Car%2520Management%2520System/3.png": "a1251cd19b8b099732d24b90b08f5886",
"assets/Assets/projects/Car%2520Management%2520System/4.png": "f084aa1c08238fedac3c89ee29950ff9",
"assets/Assets/projects/Car%2520Management%2520System/5.png": "a89dba31b2f9fb5b640e99b250ffb9a7",
"assets/Assets/projects/Car%2520Management%2520System/6.png": "2a971c458cd3dfbb0fee0ae2aa050009",
"assets/Assets/projects/Car%2520Management%2520System/7.png": "27373e04a0126105eac37dd1441d5b57",
"assets/Assets/projects/Car%2520Management%2520System/8.png": "36cdd6bca2351ddf599fe9266171c90f",
"assets/Assets/projects/Car%2520Management%2520System/9.png": "3f81c777edaef0103e3148cf06e839e7",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "57d84be40e82ab489888cc580e295806",
"assets/NOTICES": "e42f46421c16b18408a913785c7dd76e",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "e73fc851ebfb79580959864e3bd5d7cf",
"index.html": "4c907a4ce39515de7476f4de677a130d",
"/": "4c907a4ce39515de7476f4de677a130d",
"main.dart.js": "d1df36d15fbd26e80de8c16e2925afea",
"version.json": "04f858779c7ead91b5e1e4ce019437a1"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
