<script src="<?php echo base_url("assets"); ?>/dist/js/third_party/bootstrap-toggle.min.js"></script>
<script src="<?php echo base_url("assets"); ?>/dist/js/third_party/jquery.fancybox.min.js"></script>
<script src="<?php echo base_url("assets"); ?>/dist/js/dropzone/dropzone.js"></script>

<script>

    $(document).ready(function () {

        $(".dropzone").dropzone();
        


        
        $('.toggle_check').bootstrapToggle();

        

        $('.toggle_check').change(function () {

            var isActive = $(this).prop('checked');
            var base_url = $(".base_url").text();
            var id       = $(this).attr("dataID");
            $.post(base_url + "room/isActiveSetterForImage", {id: id, isActive: isActive}, function (response) {});

        })


    })
    
    $(document).ready(function(){
        
        $(".fancybox").fancybox({
            openEffect: "none",
            closeEffect: "none"
        });
    });



</script>



<script>
<script><?php 


