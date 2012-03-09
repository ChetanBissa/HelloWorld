$(document).ready(function(){
    $("#form").submit(function(){
        var select_elements = $('.select_identifier')
        for(var i=0;i<select_elements.length;i++)
        {
            if(select_elements[i].checked)
            {
                return confirm("Are you sure you want to delete selected item?");
            }
            else
            {
                alert('You need to select atleast one record.')
                return false
            }
        }
        return false
    });
    
    var data = "AndraPradesh ArunachalPradesh Assam Bihar Chhattisgarh Goa Gujarat Haryana HimachalPradesh Jammuan&Kashmir Jharkhand Karnataka Kerala MadyaPradesh Maharashtra Manipur Meghalaya Mizoram Nagaland Orissa Punjab Rajasthan Sikkim Tamil Nadu Tripura Uttaranchal UttarPradesh WestBengal Delhi".split(" ");
    $("#example").autocomplete(data);
    $("#date").datepicker({
        showAnim: 'bounce'
    });
    
   
});
