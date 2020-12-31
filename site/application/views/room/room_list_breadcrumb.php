<!-- Parallax Effect -->
<script type="text/javascript">
    $(document).ready(function () {
        $('#parallax-pagetitle').parallax("50%", -0.55);
    });
</script>

<section class="parallax-effect">
    <div id="parallax-pagetitle"
        style="background-image: url(<?php echo base_url("assets/images/parallax/tour.jpg");?>);">
        <div class="color-overlay">
            <!-- Page title -->
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <ol class="breadcrumb">
                            <li><a href="index.html">ANASAYFA</a></li>
                            <li class="active">oda listesi</li>
                        </ol>
                        <h1>ODA LİSTESİ</h1>
                    </div>

                </div>
            </div>

        </div>
    </div>
</section>


<section class="rooms mt50">
    <div class="container">

        <div class="col-sm-6">

            <form class="reservation-horizontal clearfix" role="form" method="post"
                action="<?php echo base_url("room/check_availability"); ?>">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="checkin">Başlangıç</label>
                            <div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover"
                                data-placement="right" data-content="Check-In is from 11:00"> <i
                                    class="fa fa-info-circle fa-lg"> </i> </div>
                            <i class="fa fa-calendar infield"></i>
                            <input name="checkin" type="text" id="checkin" value="" class="form-control"
                                placeholder="Check-in" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="checkout">Bitiş</label>
                            <div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover"
                                data-placement="right" data-content="Check-out is from 12:00"> <i
                                    class="fa fa-info-circle fa-lg"> </i> </div>
                            <i class="fa fa-calendar infield"></i>
                            <input name="checkout" type="text" id="checkout" value="" class="form-control"
                                placeholder="Check-out" />
                        </div>
                    </div>

                    <div class="col-md-4">
                        <button type="submit" style="margin-top:22px;"
                            class="btn btn-primary btn-block">Sorgula</button>
                    </div>
                </div>
            </form>

        </div>
    </div>
</section>