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
    <i class="bi bi-search" style="width: 10px; height: 10px;"></i>
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
        left:50px;
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
</style>
    