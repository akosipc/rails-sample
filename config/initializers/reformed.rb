Reformed::FormBuilder.input_wrapper = lambda do |controls, options|
  "<div class=\"form-group\">
    #{controls[:label]}
    #{controls[:input]}
   </div>
  "
end

Reformed::FormBuilder.action_wrapper = lambda do |controls, options|
  "<div class=\"form-group\">
    <div class=\"row\">
      <div class=\"col-xs-offset-3 col-xs-6 text-center\">
        #{controls[:action]}
      </div>
    </div>
   </div>
  "
end
