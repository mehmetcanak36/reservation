<script src="<?php echo base_url("assets"); ?>/dist/js/third_party/bootstrap-toggle.min.js"></script>
<script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
<!-- Select2 -->
<script src="<?php echo base_url("assets"); ?>/plugins/select2/select2.full.min.js"></script>
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">

<script>

    $(document).ready(function () {

        // Bootstrap Toggle init
        $('.toggle_check').bootstrapToggle();

        // isActive Change

        $('.toggle_check').change(function () {

            var isActive = $(this).prop('checked');
            var base_url = $(".base_url").text();
            var id = $(this).attr("dataID");
            $.post(base_url + "room/isActiveSetter", {id: id, isActive: isActive}, function (response) {
            });

        });

        CKEDITOR.replace('detail');

        //Initialize Select2 Elements
        $(".select2").select2();
    });

</script>