<template>
<div>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
        <!-- navbar-brand의 content 변경 -->
        <a class="navbar-brand" href="#">Fixed navbar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <!-- dropdown 메뉴 삭제 -->
            <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
            </li>
            </ul>
        </div>
    </nav>
    <div class="search">
        <form id="search" onsubmit="searchPlaces();"> <!-- return false"> -->
            <input id="search1" type="text" v-model="valueModel">
            <input id="submit" type="submit" value="검색">
            <br>
            <button id="sPlus" type="button" @click="plus()"></button>
        </form>
    </div>  
    <section class="test">
        <div id="map"></div>
    </section>
    <div id="courseList">
          <div class="accordion accordion-flush" id="accordionFlushExample">
            <div class="accordion-item">
              <h2 class="accordion-header" id="flush-headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                    Course1
                  <i class="bi bi-heart-fill"></i>14
                </button>
              </h2>
              <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                  <button class="list-group-item d-flex justify-content-between align-items-start" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background-color:antiquewhite">
                    <div class="mx-sm-5 me-auto">
                      <div class="fw-bold">Subheading</div>
                      Cras justo odio
                    </div>
                    <i class="bi bi-heart-fill"></i>14
                  </button>
                  <button class="list-group-item d-flex justify-content-between align-items-start" style="background-color:rgb(255, 253, 121)"> 
                    <div class="mx-sm-5 me-auto">
                      <div class="fw-bold">Subheading</div>
                      Cras justo odio
                    </div>
                    <i class="bi bi-heart-fill"></i>14
                  </button>
                  <button class="list-group-item d-flex justify-content-between align-items-start" style="background-color:rgb(253, 242, 86)">
                    <div class="mx-sm-5 me-auto">
                      <div class="fw-bold">Subheading</div>
                      Cras justo odio
                    </div>
                    <i class="bi bi-heart-fill"></i>14
                  </button>
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="flush-headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                  Course2
                  <i class="bi bi-heart-fill"></i>14
                </button>
              </h2>
              <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="flush-headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                  Course3
                  <i class="bi bi-heart-fill"></i>14
                </button>
              </h2>
              <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
              </div>
            </div>
          </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                ...
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
              </div>
            </div>
          </div>
        </div>

        <nav aria-label="Page navigation example">
            <ul class="pagination">
              <li class="page-item"><a class="page-link" href="#">Previous</a></li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </nav>
</div>
</template>
<script>
  export default {
    data() {
      return {
        valueModel: 'Enter the Place',
        textValue: "",
        map: null,
        markers: [],
        latitude: 0,
        longitude: 0
      };
    },
    created() {
        if (!("geolocation" in navigator)) {
        return;
        }

        // get position
        navigator.geolocation.getCurrentPosition(pos => {
        this.latitude = pos.coords.latitude;
        this.longitude = pos.coords.longitude;

        if (window.kakao && window.kakao.maps) {

            this.initMap();

        } else {
            const script = document.createElement("script");
            /* global kakao */
            script.onload = () => kakao.maps.load(this.initMap);
            script.src = "//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=c17b5563968f2fffd356919521833ce2";
            document.head.appendChild(script);
        }

        }, err => {
        alert(err.message);
        })
    },
    methods: {
        initMap() {
        const container = document.getElementById("map");
        const options = {
            center: new kakao.maps.LatLng(33.450701, 126.570667),
            level: 5,
        };
        this.map = new kakao.maps.Map(container, options);
        this.displayMarker([[this.latitude, this.longitude]]);
        },
        displayMarker(markerPositions) {
        if (this.markers.length > 0) {
            this.markers.forEach((marker) => marker.setMap(null));
        }

        const positions = markerPositions.map(
            (position) => new kakao.maps.LatLng(...position)
        );

        if (positions.length > 0) {
            this.markers = positions.map(
                (position) =>
                    new kakao.maps.Marker({
                    map: this.map,
                    position,
                    })
            );

            const bounds = positions.reduce(
                (bounds, latlng) => bounds.extend(latlng),
                new kakao.maps.LatLngBounds()
            );

            this.map.setBounds(bounds);
        }
        }
    }
}
</script>
<style scoped>
    .search {
        position:absolute;
        top:80px;
        left:10px;
        width:750px;
        height:500px;
    }
    #sPlus {
        position:relative;
        left:90px;
        width:25px;
        height:25px;
        text-align:center;
    }
    .test {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    }

    #map {
        position:absolute;
        top:80px;
        left:600px;
        width: 650px;
        height: 600px;
        border: 1px #a8a8a8 solid;
    }
    #courseList {
        position:absolute;
        top:150px;
        left:200px;
        width:300px;
        height:250px;
    }
    .pagination {
        position:absolute;
        top:650px;
        left:225px;
        width:700px;
    }
</style>
    