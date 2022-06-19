% This program is a smart calculator that has 50 functions in total
% TOPICS COVERED: Basic Commands and Functions, Different Types of
% Equations and Polynomials, Graphing 2D Plots, Graphing 3D Plots, Higher
% Mathematical Operations
% ADDITIONAL FEATURES: uicontrol, contains(), get(), set(), global function
% About Global function: it is risky and dangerous for the program to use such function and
% can make debugging difficult but it is inevitable to use the function when dealing with 
% variables that are needed to be used inside and outside different functions.
% About clear all function: it is necessary for this program to avoid different kinds of errors that may 
% occur while the calculator is performing tasks.


function Smart_Calculator
    clear all

    main_fig = figure('Name', 'Smart Calculator');
    main_fig.NumberTitle = 'off';
    main_fig.MenuBar = 'none';
    main_fig.ToolBar = 'none';
    main_fig.Position = [750 300 350 550];
    main_fig.Resize = 'off';
    main_fig.Color = '#D5D5D5';

    % Text for Smart Calculator
    smart_edit_ui = uicontrol(main_fig);
    smart_edit_ui.Style = 'text';
    smart_edit_ui.String = 'Smart Calculator';
    smart_edit_ui.FontSize = 16;
    smart_edit_ui.BackgroundColor = 'blue';
    smart_edit_ui.ForegroundColor = 'cyan';
    smart_edit_ui.FontAngle = 'italic';
    smart_edit_ui.Position = [-20 285 400 30];
    
    % Input text box
    input_edit_ui = uicontrol(main_fig);
    input_edit_ui.Style = 'edit';
    input_edit_ui.Position = [20 430 311 100];
    input_edit_ui.HorizontalAlignment = 'left';
    input_edit_ui.Max = 30;
    input_edit_ui.Min = 0;
    input_edit_ui.FontSize = 12;
    input_edit_ui.String = '';
    
    % Output text box
    output_edit_ui = uicontrol(main_fig);
    output_edit_ui.Style = 'edit';
    output_edit_ui.Position = [20 325 311 100];
    output_edit_ui.HorizontalAlignment = 'left';
    output_edit_ui.Max = 30;
    output_edit_ui.Min = 0;
    output_edit_ui.Enable = 'off';
    output_edit_ui.FontSize = 12;
    output_edit_ui.String = '';

    % Clear 
    clear_b = uicontrol(main_fig);
    clear_b.Style = 'pushbutton';
    clear_b.String = 'Clear';
    clear_b.BackgroundColor = '#add8e6';
    clear_b.Position = [243 30 50 30];
    clear_b.Callback = @clearfunc;
    
    % On and Off
    onandoff_b = uicontrol(main_fig);
    onandoff_b.Style = 'togglebutton';
    onandoff_b.BackgroundColor = '#19A2F6'; % light cyan
    onandoff_b.String = 'On';
    onandoff_b.Position = [299 30 32 30];
    onandoff_b.Callback = @onandoff;
    
    % Square root, cube root, nth root panels
    sqrt_b = uicontrol(main_fig);
    sqrt_b.Style = 'pushbutton';
    sqrt_b.String = '√';
    sqrt_b.BackgroundColor = '#add8e6';
    sqrt_b.Max = 1;
    sqrt_b.Min = 0;
    sqrt_b.FontSize = 12;
    sqrt_b.Position = [19 230 50 30];
    sqrt_b.Callback = @sqrtfunc;

    shift_cube_b = uicontrol(main_fig);
    shift_cube_b.Style = 'text';
    shift_cube_b.String = '∛';
    shift_cube_b.FontSize = 12;
    shift_cube_b.ForegroundColor = 'magenta';
    shift_cube_b.Position = [20 261 20 18];
    shift_cube_b.BackgroundColor = '#D5D5D5';

    shift2_nthroot_b = uicontrol(main_fig);
    shift2_nthroot_b.Style = 'text';
    shift2_nthroot_b.String = 'n√a';
    shift2_nthroot_b.FontSize = 8.7;
    shift2_nthroot_b.ForegroundColor = '#FFA500'; % orange
    shift2_nthroot_b.Position = [38 260 30 14];
    shift2_nthroot_b.BackgroundColor = '#D5D5D5';


    % Indefinite integral
    int_b = uicontrol(main_fig);
    int_b.Style = 'pushbutton';
    int_b.String = '∫dn';
    int_b.BackgroundColor = '#add8e6';
    int_b.FontSize = 12;
    int_b.Position = [19 180 50 30];
    int_b.Callback = @intfunc;


    % Derivative 
    diff_b = uicontrol(main_fig);
    diff_b.Style = 'pushbutton';
    diff_b.String = 'dn/dn';
    diff_b.BackgroundColor = '#add8e6';
    diff_b.FontSize = 12;
    diff_b.Position = [75 180 50 30];
    diff_b.Callback = @difffunc;


    % Laplace, Inverse Laplace
    laplace_b = uicontrol(main_fig);
    laplace_b.Style = 'pushbutton';
    laplace_b.String = 'Laplace';
    laplace_b.BackgroundColor = '#add8e6';
    laplace_b.FontSize = 9;
    laplace_b.FontAngle = 'italic';
    laplace_b.Position = [19 130 50 30];
    laplace_b.Callback = @laplacefunc;
    
    shift_ilaplace_b = uicontrol(main_fig);
    shift_ilaplace_b.Style = 'text';
    shift_ilaplace_b.String = 'ILaplace';
    shift_ilaplace_b.FontSize = 8;
    shift_ilaplace_b.FontAngle = 'italic';
    shift_ilaplace_b.ForegroundColor = 'magenta';
    shift_ilaplace_b.Position = [16 161 50 13];
    shift_ilaplace_b.BackgroundColor = '#D5D5D5';
    
    
    % Fourier
    fourier_b = uicontrol(main_fig);
    fourier_b.Style = 'pushbutton';
    fourier_b.String = 'Fourier';
    fourier_b.BackgroundColor = '#add8e6';
    fourier_b.FontSize = 10;
    fourier_b.Position = [75 130 50 30];
    fourier_b.Callback = @fourierfunc;


    % Factorial
    factorial_b = uicontrol(main_fig);
    factorial_b.Style = 'pushbutton';
    factorial_b.String = 'x!';
    factorial_b.BackgroundColor = '#add8e6';
    factorial_b.FontSize = 12;
    factorial_b.Position = [19 80 50 30];
    factorial_b.Callback = @factfunc;


    % Exp
    exp_b = uicontrol(main_fig);
    exp_b.Style = 'pushbutton';
    exp_b.String = 'exp';
    exp_b.BackgroundColor = '#add8e6';
    exp_b.FontSize = 12;
    exp_b.Position = [75 80 50 30];
    exp_b.Callback = @expfunc;

    
    % 3D plot
    three_plot_b = uicontrol(main_fig);
    three_plot_b.Style = 'pushbutton';
    three_plot_b.String = '3D';
    three_plot_b.BackgroundColor = '#E7DB25';
    three_plot_b.FontSize = 8;
    three_plot_b.Position = [19 30 50 30];
    three_plot_b.Callback = @threeplot;


    % mesh plot
    mesh_plot_b = uicontrol(main_fig);
    mesh_plot_b.Style = 'pushbutton';
    mesh_plot_b.String = 'Mesh';
    mesh_plot_b.BackgroundColor = '#E7AF25';
    mesh_plot_b.FontSize = 8;
    mesh_plot_b.Position = [75 30 50 30];
    mesh_plot_b.Callback = @meshplot;


    % sphere mesh and surf plot
    sphere_plot = uicontrol(main_fig);
    sphere_plot.Style = 'pushbutton';
    sphere_plot.String = 'Sphere';
    sphere_plot.BackgroundColor = '#E77A25';
    sphere_plot.FontSize = 8;
    sphere_plot.Position = [131 30 50 30];
    sphere_plot.Callback = @sphereplot;


    % Cylinder surf plot
    cylinder_plot = uicontrol(main_fig);
    cylinder_plot.Style = 'pushbutton';
    cylinder_plot.String = 'Cylinder';
    cylinder_plot.BackgroundColor = '#E7259B';
    cylinder_plot.FontSize = 8;
    cylinder_plot.Position = [187 30 50 30];
    cylinder_plot.Callback = @cylinderplot;


    % Log10, ln panels
    log10_b = uicontrol(main_fig);
    log10_b.Style = 'pushbutton';
    log10_b.String = 'log';
    log10_b.BackgroundColor = '#add8e6';
    log10_b.FontSize = 12;
    log10_b.Position = [75 230 50 30];
    log10_b.Callback = @log10func;
    
    shift_ln_t = uicontrol(main_fig);
    shift_ln_t.Style = 'text';
    shift_ln_t.String = 'ln';
    shift_ln_t.FontSize = 9;
    shift_ln_t.ForegroundColor = 'magenta';
    shift_ln_t.Position = [76 260 15 14];
    shift_ln_t.BackgroundColor = '#D5D5D5';
    
    shift2_loglog_t = uicontrol(main_fig);
    shift2_loglog_t.Style = 'text';
    shift2_loglog_t.String = 'loglog';
    shift2_loglog_t.FontSize = 8;
    shift2_loglog_t.ForegroundColor = '#FFA500';
    shift2_loglog_t.Position = [94 260 30 14];
    shift2_loglog_t.BackgroundColor = '#D5D5D5';
    

    % sin
    sin_b = uicontrol(main_fig);
    sin_b.Style = 'pushbutton';
    sin_b.String = 'sin';
    sin_b.BackgroundColor = '#add8e6';
    sin_b.FontSize = 12;
    sin_b.Position = [131 230 50 30];
    sin_b.Callback = @sinfunc;

    shift_arcsin_t = uicontrol(main_fig);
    shift_arcsin_t.Style = 'text';
    shift_arcsin_t.String = 'arcsin';
    shift_arcsin_t.FontSize = 8;
    shift_arcsin_t.ForegroundColor = 'magenta';
    shift_arcsin_t.Position = [133 261 32 11];
    shift_arcsin_t.BackgroundColor = '#D5D5D5';

    
    % cos
    cos_b = uicontrol(main_fig);
    cos_b.Style = 'pushbutton';
    cos_b.String = 'cos';
    cos_b.BackgroundColor = '#add8e6';
    cos_b.FontSize = 12;
    cos_b.Position = [187 230 50 30];
    cos_b.Callback = @cosfunc;

    shift_arccos_b = uicontrol(main_fig);
    shift_arccos_b.Style = 'text';
    shift_arccos_b.String = 'arccos';
    shift_arccos_b.FontSize = 8;
    shift_arccos_b.ForegroundColor = 'magenta';
    shift_arccos_b.Position = [189 261 36 11];
    shift_arccos_b.BackgroundColor = '#D5D5D5'; % Light gray
    

    % tan
    tan_b = uicontrol(main_fig);
    tan_b.Style = 'pushbutton';
    tan_b.String = 'tan';
    tan_b.BackgroundColor = '#add8e6';
    tan_b.FontSize = 12;
    tan_b.Position = [243 230 50 30];
    tan_b.Callback = @tanfunc;

    shift_arctan_b = uicontrol(main_fig);
    shift_arctan_b.Style = 'text';
    shift_arctan_b.String = 'arctan';
    shift_arctan_b.BackgroundColor = '#D5D5D5'; % Light gray
    shift_arctan_b.ForegroundColor = 'magenta';
    shift_arctan_b.FontSize = 8;
    shift_arctan_b.Position = [243 261 36 11];
    shift_arctan_b.Callback = @arctanfunc;


    % csc
    csc_b = uicontrol(main_fig);
    csc_b.Style = 'pushbutton';
    csc_b.String = 'csc';
    csc_b.BackgroundColor = '#add8e6';
    csc_b.FontSize = 12;
    csc_b.Position = [131 180 50 30];
    csc_b.Callback = @cscfunc;
    
    shift_arccsc_b = uicontrol(main_fig);
    shift_arccsc_b.Style = 'text';
    shift_arccsc_b.String = 'arccsc';
    shift_arccsc_b.BackgroundColor = '#D5D5D5'; % Light gray
    shift_arccsc_b.ForegroundColor = 'magenta';
    shift_arccsc_b.FontSize = 8;
    shift_arccsc_b.Position = [133 212 36 11];


    % sec
    sec_b = uicontrol(main_fig);
    sec_b.Style = 'pushbutton';
    sec_b.String = 'sec';
    sec_b.BackgroundColor = '#add8e6';
    sec_b.FontSize = 12;
    sec_b.Position = [187 180 50 30];
    sec_b.Callback = @secfunc;

    shift_arcsec_b = uicontrol(main_fig);
    shift_arcsec_b.Style = 'text';
    shift_arcsec_b.String = 'arcsec';
    shift_arcsec_b.BackgroundColor = '#D5D5D5'; % Light gray
    shift_arcsec_b.ForegroundColor = 'magenta';
    shift_arcsec_b.FontSize = 8;
    shift_arcsec_b.Position = [188 212 36 11];

    
    % cot
    cot_b = uicontrol(main_fig);
    cot_b.Style = 'pushbutton';
    cot_b.String = 'cot';
    cot_b.BackgroundColor = '#add8e6';
    cot_b.FontSize = 12;
    cot_b.Position = [243 180 50 30];
    cot_b.Callback = @cotfunc;

    shift_arccot_b = uicontrol(main_fig);
    shift_arccot_b.Style = 'text';
    shift_arccot_b.String = 'arccot';
    shift_arccot_b.BackgroundColor = '#D5D5D5'; % Light gray
    shift_arccot_b.ForegroundColor = 'magenta';
    shift_arccot_b.FontSize = 8;
    shift_arccot_b.Position = [243 212 36 11];

    
    % hyperbolic sin
    sinh_b = uicontrol(main_fig);
    sinh_b.Style = 'pushbutton';
    sinh_b.String = 'sinh';
    sinh_b.BackgroundColor = '#add8e6';
    sinh_b.FontSize = 12;
    sinh_b.Position = [131 130 50 30];
    sinh_b.Callback = @sinhfunc;

    shift_arcsinh_b = uicontrol(main_fig);
    shift_arcsinh_b.Style = 'text';
    shift_arcsinh_b.String = 'arcsinh';
    shift_arcsinh_b.BackgroundColor = '#D5D5D5'; % Light gray
    shift_arcsinh_b.ForegroundColor = 'magenta';
    shift_arcsinh_b.FontSize = 8;
    shift_arcsinh_b.Position = [132 162 38 11];
    

    % hyperbolic cos
    cosh_b = uicontrol(main_fig);
    cosh_b.Style = 'pushbutton';
    cosh_b.String = 'cosh';
    cosh_b.BackgroundColor = '#add8e6';
    cosh_b.FontSize = 12;
    cosh_b.Position = [187 130 50 30];
    cosh_b.Callback = @coshfunc;

    shift_arccosh_b = uicontrol(main_fig);
    shift_arccosh_b.Style = 'text';
    shift_arccosh_b.String = 'arccosh';
    shift_arccosh_b.BackgroundColor = '#D5D5D5'; % Light gray
    shift_arccosh_b.ForegroundColor = 'magenta';
    shift_arccosh_b.FontSize = 8;
    shift_arccosh_b.Position = [188 162 42 11];
            

    % hyperbolic tanh
    tanh_b = uicontrol(main_fig);
    tanh_b.Style = 'pushbutton';
    tanh_b.String = 'tanh';
    tanh_b.BackgroundColor = '#add8e6';
    tanh_b.FontSize = 12;
    tanh_b.Position = [243 130 50 30];
    tanh_b.Callback = @tanhfunc;
    
    shift_arctanh_b = uicontrol(main_fig);
    shift_arctanh_b.Style = 'text';
    shift_arctanh_b.String = 'arctanh';
    shift_arctanh_b.BackgroundColor = '#D5D5D5'; % Light gray
    shift_arctanh_b.ForegroundColor = 'magenta';
    shift_arctanh_b.FontSize = 8;
    shift_arctanh_b.Position = [243 162 36 11];

    
    % hyperbolic csch
    csch_b = uicontrol(main_fig);
    csch_b.Style = 'pushbutton';
    csch_b.String = 'csch';
    csch_b.BackgroundColor = '#add8e6';
    csch_b.FontSize = 12;
    csch_b.Position = [131 80 50 30];
    csch_b.Callback = @cschfunc;

    shift_arccsch_b = uicontrol(main_fig);
    shift_arccsch_b.Style = 'text';
    shift_arccsch_b.String = 'arccsch';
    shift_arccsch_b.BackgroundColor = '#D5D5D5'; % Light gray
    shift_arccsch_b.ForegroundColor = 'magenta';
    shift_arccsch_b.FontSize = 8;
    shift_arccsch_b.Position = [131 112 42 11];


    % hyperbolic sech
    sech_b = uicontrol(main_fig);
    sech_b.Style = 'pushbutton';
    sech_b.String = 'sech';
    sech_b.BackgroundColor = '#add8e6';
    sech_b.FontSize = 12;
    sech_b.Position = [187 80 50 30];
    sech_b.Callback = @sechfunc;

    shift_arcsech_b = uicontrol(main_fig);
    shift_arcsech_b.Style = 'text';
    shift_arcsech_b.String = 'arcsech';
    shift_arcsech_b.BackgroundColor = '#D5D5D5'; % Light gray
    shift_arcsech_b.ForegroundColor = 'magenta';
    shift_arcsech_b.FontSize = 8;
    shift_arcsech_b.Position = [188 112 42 11];


    % hyperbolic coth
    coth_b = uicontrol(main_fig);
    coth_b.Style = 'pushbutton';
    coth_b.String = 'coth';
    coth_b.BackgroundColor = '#add8e6';
    coth_b.FontSize = 12;
    coth_b.Position = [243 80 50 30];
    coth_b.Callback = @cothfunc;
    
    shift_arccoth_b = uicontrol(main_fig);
    shift_arccoth_b.Style = 'text';
    shift_arccoth_b.String = 'arccoth';
    shift_arccoth_b.BackgroundColor = '#D5D5D5'; % Light gray
    shift_arccoth_b.ForegroundColor = 'magenta';
    shift_arccoth_b.FontSize = 8;
    shift_arccoth_b.Position = [244 112 39 11];



    % Function buttons

    % Shift button
    shift_b = uicontrol(main_fig);
    shift_b.Style = 'togglebutton';
    shift_b.String = 'Shift';
    shift_b.BackgroundColor = 'magenta';
    shift_b.Position = [299 230 32 30];
    shift_b.Callback = @shift;
    
    shift2_b = uicontrol(main_fig);
    shift2_b.Style = 'togglebutton';
    shift2_b.String = 'Shift2';
    shift2_b.FontSize = 8;
    shift2_b.BackgroundColor = '#FFA500';
    shift2_b.Position = [299 180 32 30];
    shift2_b.Callback = @shift2;


    % Degrees
    degrad_b = uicontrol(main_fig);
    degrad_b.Style = 'togglebutton';
    degrad_b.BackgroundColor = '#19A2F6'; % light cyan
    degrad_b.String = 'Deg';
    degrad_b.Position = [299 130 32 30];
    degrad_b.Callback = @degrad;
    
    deg_text = uicontrol(main_fig);
    deg_text.Style = 'text';
    deg_text.String = 'Deg';
    deg_text.BackgroundColor = '#D5D5D5'; % Light gray
    deg_text.ForegroundColor = 'blue';
    deg_text.Position = [300 531 32 15];


    % Ans
    ans_b = uicontrol(main_fig);
    ans_b.Style = 'pushbutton';
    ans_b.BackgroundColor = '#19A2F6'; % light cyan
    ans_b.String = 'Ans';
    ans_b.Position = [299 80 32 30];
    ans_b.Callback = @answers;
    

    % Help button
    help_b = uicontrol(main_fig);
    help_b.Style = 'pushbutton';
    help_b.String = 'Help';
    help_b.BackgroundColor = '#19A2F6';
    help_b.Position = [291 287 40 25];
    help_b.Callback = @helpme;
   


    % FUNCTIONS

    % Help function
    function helpme(~, ~)
        help_fig = figure('Name', 'Help Section');
        help_fig.NumberTitle = 'off';
        help_fig.MenuBar = 'none';
        help_fig.ToolBar = 'none';
        help_fig.Units = 'normalized';
        help_fig.Position = [0.1395 0.277 0.25 0.509];

        help_string = ...
            "--GUIDE IN USING THE SMART CALCULATOR--" + newline + newline +...
            "NOTE:" + newline +...
            "Observe proper usage of .*, ./ etc. May encounter errors if input is wrong"+...
            newline+newline+...
            "--IDENTIFIERS--" + newline + newline +...
            "Shift -> Corresponds to the functions that are in magenta color" + newline +...
            "Shift2 -> Corresponds to the functions that are in orange color" + newline +...
            "Deg -> Toggle on and off; default is deg, stressed is rad" + newline +...
            "Ans -> Can perform any numeric expressions except for functions provided"...
            + newline +...
            "Example: Operators: 4 + 4 | Arrays: [2 2 3] + [3 2 1]" + newline +...
            "Clear -> Clears all functions and will turn into normal state" + newline +...
            "On -> Toggle on and off; default is on, stressed is off" + newline + newline +...
            "--FUNCTIONS--" + newline + newline +...
            "Only Numeric Entries:" + newline +...
            "√ -> square root of something (values first before press)" + newline +...
            "∛ -> cube root of something (values first before press)" + newline +...
            "n√a -> nth root of something (press first)" + newline +...
            "log -> log10 of something (values first before press)" + newline +...
            "ln -> natural logarithmic (values first before press)" + newline +...
            "sin -> sine in deg and rad (values first before press)" + newline +...
            "arcsin -> sine^-1 in degrees and radians (values first before press)" + newline +...
            "cos -> cosine in deg and rad (values first before press)" + newline +...
            "arccos -> cosine^-1 in deg and rad (values first before press)" + newline +...
            "tan -> tangent in deg and rad (values first before press)" + newline +...
            "arctan -> tangent^-1 in deg and rad (values first before press)" + newline +...
            "csc -> cosecant in deg and rad (values first before press)" + newline +...
            "arccsc -> cosecant^-1 in deg and rad (values first before press)" + newline +...
            "sec -> secant in deg and rad (values first before press)" + newline +...
            "arcsec -> secant^-1 in deg and rad (values first before press)" + newline +...
            "cot -> cotangent in deg and rad (values first before press)" + newline +...
            "arccot -> cotangent^-1 in deg and rad (values first before press)" + newline +...
            "sinh -> hyperbolic sine in rad (values first before press)" + newline +...
            "arcsinh -> inverse hyperbolic sine in rad (values first before press)" + newline +...
            "cosh -> hyperbolic cosine in rad (values first before press)" + newline +...
            "arccosh -> inverse hyperbolic cosine in rad (values first before press)" +...
            newline +...
            "tanh -> hyperbolic tangent in rad (values first before press)" + newline +...
            "arctanh -> inverse hyperbolic tangent in rad (values first before press)" + newline...
            +...
            "x! -> factorial of something (values first before press)" + newline +...
            "exp -> exponential function e^x (values first before press)" + newline +...
            "Sphere -> Mesh, and surf plots of a sphere; only radius input is required" +...
            newline +...
            "Cylinder -> Surf plot of cylinder; only radius input is required" + newline +...
            newline + "Can Have Variables with Numberic Entries:" + newline +...
            "loglog -> loglog plot [only accepts 'x' variable] (values first before press)" +...
            newline +...
            "∫ -> integral with respect to a-z choices (press first)" + newline +...
            "dn/dn -> derivative with respect to a-z and unlimited order (press first)"+...
            newline +...
            "Laplace -> laplace [variables from a-z] (values first before press)" + newline +...
            "ILaplace -> inverse laplace [variables from a-z] (values first before press)" +...
            newline +...
            "Fourier -> fourier [variables from a-z] (values first before press)" + newline +...
            "3D -> 3D plot [only accepts t variable] (press first)" + newline +...
            "Mesh -> Different kinds of 3D plots [only accepts x and y variables]" +newline;
            

        help_edit_ui = uicontrol('FontWeight', 'bold');
        help_edit_ui.Style = 'edit';
        help_edit_ui.Enable = 'off';
        help_edit_ui.Max = 2;
        help_edit_ui.Min = 0;
        help_edit_ui.FontSize = 9;
        help_edit_ui.HorizontalAlignment = 'left';
        help_edit_ui.String = help_string;
        help_edit_ui.Position = [20 20 442 510];
    end
    
    % Ans function
    function answers(~, ~)
        input_a = get(input_edit_ui, 'String');
        if contains(input_a, "log")
            return;
        end
        if contains(input_a, "sqrt")
            return;
        end
        if contains(input_a, "nthroot")
            return;
        end
        if contains(input_a, "log10")
            return;
        end
        if contains(input_a, "ln")
            return;
        end
        if contains(input_a, "loglog")
            return;
        end
        if contains(input_a, "sind")
            return;
        end
        if contains(input_a, "sin")
            return;
        end
        if contains(input_a, "asind")
            return;
        end
        if contains(input_a, "asin")
            return;
        end
        if contains(input_a, "cosd")
            return;
        end
        if contains(input_a, "cos")
            return;
        end
        if contains(input_a, "acosd")
            return;
        end
        if contains(input_a, "acos")
            return;
        end
        if contains(input_a, "tand")
            return;
        end
        if contains(input_a, "tan")
            return;
        end
        if contains(input_a, "atand")
            return;
        end
        if contains(input_a, "atan")
            return;
        end
        if contains(input_a, "int")
            return;
        end
        if contains(input_a, "diff")
            return;
        end
        if contains(input_a, "cscd")
            return;
        end
        if contains(input_a, "csc")
            return;
        end
        if contains(input_a, "acscd")
            return;
        end
        if contains(input_a, "acsc")
            return;
        end
        if contains(input_a, "secd")
            return;
        end
        if contains(input_a, "sec")
            return;
        end
        if contains(input_a, "asecd")
            return;
        end
        if contains(input_a, "asec")
            return;
        end
        if contains(input_a, "cotd")
            return;
        end
        if contains(input_a, "cot")
            return;
        end
        if contains(input_a, "acotd")
            return;
        end
        if contains(input_a, "acot")
            return;
        end
        if contains(input_a, "laplace")
            return;
        end
        if contains(input_a, "ilaplace")
            return;
        end
        if contains(input_a, "fourier")
            return;
        end
        if contains(input_a, "sinh")
            return;
        end
        if contains(input_a, "asinh")
            return;
        end
        if contains(input_a, "cosh")
            return;
        end
        if contains(input_a, "acosh")
            return;
        end
        if contains(input_a, "tanh")
            return;
        end
        if contains(input_a, "atanh")
            return;
        end
        if contains(input_a, "factorial")
            return;
        end
        if contains(input_a, "exp")
            return;
        end
        if contains(input_a, "csch")
            return;
        end
        if contains(input_a, "acsch")
            return;
        end
        if contains(input_a, "sech")
            return;
        end
        if contains(input_a, "asech")
            return;
        end
        if contains(input_a, "coth")
            return;
        end
        if contains(input_a, "acoth")
            return;
        end
        if contains(input_a, "plot3")
            return;
        end
        if contains(input_a, "mesh")
            return;
        end
        if contains(input_a, "surf")
            return;
        end
        if contains(input_a, "contour")
            return;
        end
        if contains(input_a, "sphere")
            return;
        end
        if contains(input_a, "cylinder")
            return;
        end
        
        input_ans = get(input_edit_ui, 'String');
        output_ans = eval(input_ans);
        set(output_edit_ui, 'String', output_ans);



        
    end

    % On and Off function
    function onandoff(~, ~)
        value = get(onandoff_b, 'Value');
        if value == 1
            set(input_edit_ui, 'Enable', 'off', 'String', '');
            set(output_edit_ui, 'String', '');
            set(onandoff_b, 'String', 'Off', 'BackgroundColor', 'green');
        else
            set(input_edit_ui, 'Enable', 'on');
            set(onandoff_b, 'String', 'On', 'BackgroundColor', '#19A2F6');
        end
    end

    % Shift function
    function shift(~, ~)
        con = get(shift_b, 'Value');
        if con == 1
            shift_text = uicontrol(main_fig);
            shift_text.Style = 'text';
            shift_text.String = 'Shift';
            shift_text.BackgroundColor = '#D5D5D5';
            shift_text.ForegroundColor = 'magenta';
            shift_text.Position = [18 531 32 15];
            
            % Disabling shift2
            set(shift2_b, 'Enable', 'off');
        else
            shift_text = uicontrol(main_fig);
            shift_text.Style = 'text';
            shift_text.String = '';
            shift_text.BackgroundColor = '#D5D5D5';
            shift_text.Position = [21 531 32 15];
            % Enabling shift2
            set(shift2_b, 'Enable', 'on');
        end
    end
    
    % Shift2 function
    function shift2(~, ~)
        con = get(shift2_b, 'Value');
        if con == 1
            shift2_text = uicontrol(main_fig);
            shift2_text.Style = 'text';
            shift2_text.String = 'Shift 2';
            shift2_text.BackgroundColor = '#D5D5D5';
            shift2_text.ForegroundColor = '#FFA500';
            shift2_text.Position = [21 531 35 15];
           
            % Disabling shift
            set(shift_b, 'Enable', 'off');
        else
            shift2_text = uicontrol(main_fig);
            shift2_text.Style = 'text';
            shift2_text.String = '';
            shift2_text.BackgroundColor = '#D5D5D5'; % Light gray
            shift2_text.Position = [21 531 35 15];

            % Enabling shift
            set(shift_b, 'Enable', 'on');
        end
    end

    
    % Degree and radians function
    function degrad(~, ~)
        con = get(degrad_b, 'Value');
        % Rad
        if con == 1
            set(degrad_b, 'String', 'Rad', 'BackgroundColor', 'green');
            set(deg_text, 'String', 'Rad', 'ForegroundColor', 'green');
        % Deg
        else
            set(degrad_b, 'String', 'Deg', 'BackgroundColor', '#19A2F6');
            set(deg_text, 'String', 'Deg', 'ForegroundColor', '#19A2F6');
        end
    end

    
    % Not Shifted Functions

    % Squareroot
    function sqrtfunc(~, ~)
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        if shift == 0 && shift2 == 0
            sqrt_in = get(input_edit_ui, 'String');
            sqrt_num = str2double(sqrt_in);
            sqrt_out = sqrt(sqrt_num);
            set(output_edit_ui, 'String', sqrt_out);
        elseif shift == 1
            cube_in = get(input_edit_ui, 'String');
            cube_num = str2double(cube_in);
            cube_out = nthroot(cube_num, 3);
            set(output_edit_ui, 'String', cube_out);
        elseif shift2 == 1
            global rootn_edit_ui
            global nth_b
            global nth_text
            global root_text
            global root_val
            root_val = get(sqrt_b, 'Value');
            set(input_edit_ui, 'Position', [20 430 156 100]);
            rootn_edit_ui = uicontrol(main_fig);
            rootn_edit_ui.Style = 'edit';
            rootn_edit_ui.Position = [176 480 155 50];
            rootn_edit_ui.HorizontalAlignment = 'left';
            rootn_edit_ui.FontSize = 12;
            
            nth_b = uicontrol(main_fig);
            nth_b.Style = 'pushbutton';
            nth_b.String = 'n√a';
            nth_b.BackgroundColor = '#19A2F6';
            nth_b.Position = [177 430 154 50];
            nth_b.Callback = @nthexec;

            nth_text = uicontrol(main_fig);
            nth_text.Style = 'text';
            nth_text.String = 'Value';
            nth_text.BackgroundColor = 'white';
            nth_text.Position = [115 440 30 15];

            root_text = uicontrol(main_fig);
            root_text.Style = 'text';
            root_text.String = 'Root';
            root_text.BackgroundColor = 'white';
            root_text.Position = [285 490 30 15];

            % Disable
            set(int_b, 'Enable', 'off');
            set(diff_b, 'Enable', 'off');
            set(sqrt_b, 'Enable', 'off');
            set(three_plot_b, 'Enable', 'off');
        end
        
        function nthexec(~, ~)
            nth_in = get(input_edit_ui, 'String');
            rootn_in = get(rootn_edit_ui, 'String');
            nth_num = str2double(nth_in);
            nth_root = str2double(rootn_in);
            nth_out = nthroot(nth_num, nth_root);
            set(output_edit_ui, 'String', nth_out);
        end
    end

    % Log10, ln, loglog function
    function log10func(~, ~)
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        if shift == 0 && shift2 == 0
            log10_in = get(input_edit_ui, 'String');
            log10_num = str2double(log10_in);
            log10_out = log10(log10_num);
            set(output_edit_ui, 'String', log10_out);
        elseif shift == 1
            ln_in = get(input_edit_ui, 'String');
            ln_num = str2double(ln_in);
            ln_out = log(ln_num);
            set(output_edit_ui, 'String', ln_out);
        elseif shift2 == 1
            global logfig
            % Loglog figure
            logfig = figure('Name', 'Loglog Plot', 'Resize', 'off');
            logfig.NumberTitle = 'off';
            logfig.MenuBar = 'none';
            logfig.ToolBar = 'none';
            logfig.Position = [1102 300 300 283];
            logaxis = axes('Parent', logfig, 'Position', [0.15 0.18 0.7 0.7]);
            x = 1:1:100;
            loglog_in = get(input_edit_ui, 'String');
            loglog_in = eval(loglog_in);
            loglog(x, loglog_in, 'Parent', logaxis);
            title('Loglog Plot', 'Parent', logaxis);
            xlabel('x-axis', 'Parent', logaxis);
            ylabel('y-axis', 'Parent', logaxis);
        end
    end

    % sin
    function sinfunc(~, ~)
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        degrad = get(degrad_b, 'Value');
        if shift == 0 && shift2 == 0 && degrad == 0 % deg state
            sind_in = get(input_edit_ui, 'String');
            sind_num = str2double(sind_in);
            sind_out = sind(sind_num);
            set(output_edit_ui, 'String', sind_out);
        elseif shift == 0 && shift2 == 0 && degrad == 1 % rad state
            sinr_in = get(input_edit_ui, 'String');
            sinr_num = str2double(sinr_in);
            sinr_out = sin(sinr_num);
            set(output_edit_ui, 'String', sinr_out);
        elseif shift == 1
            arcsin_in = get(input_edit_ui, 'String');
            arcsin_num = str2double(arcsin_in);
            arcsin_out = asind(arcsin_num);
            set(output_edit_ui, 'String', arcsin_out);
        end
    end

    % cos
    function cosfunc(~, ~)
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        degrad = get(degrad_b, 'Value');
        if shift == 0 && shift2 == 0 && degrad == 0
            cosd_in = get(input_edit_ui, 'String');
            cosd_num = str2double(cosd_in);
            cosd_out = cosd(cosd_num);
            set(output_edit_ui, 'String', cosd_out);
        elseif shift == 0 && shift2 == 0 && degrad == 1
            cosr_in = get(input_edit_ui, 'String');
            cosr_num = str2double(cosr_in);
            cosr_out = cos(cosr_num);
            set(output_edit_ui, 'String', cosr_out);
        elseif shift == 1
            arccos_in = get(input_edit_ui, 'String');
            arccos_num = str2double(arccos_in);
            arccos_out = acosd(arccos_num);
            set(output_edit_ui, 'String', arccos_out);
        end
    end

    % tan
    function tanfunc(~, ~)
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        degrad = get(degrad_b, 'Value');
        if shift == 0 && shift2 == 0 && degrad == 0
            tand_in = get(input_edit_ui, 'String');
            tand_num = str2double(tand_in);
            tand_out = tand(tand_num);
            set(output_edit_ui, 'String', tand_out);
        elseif shift == 0 && shift2 == 0 && degrad == 1
            tanr_in = get(input_edit_ui, 'String');
            tanr_num = str2double(tanr_in);
            tanr_out = tan(tanr_num);
            set(output_edit_ui, 'String', tanr_out);
        elseif shift == 1
            arctan_in = get(input_edit_ui, 'String');
            arctan_num = str2double(arctan_in);
            arctan_out = atand(arctan_num);
            set(output_edit_ui, 'String', arctan_out);
        end
    end

    % indefinite integral
    function intfunc(~, ~)
        global pop_int
        global intexec_b
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        if shift == 0 && shift2 == 0
            global int_val
            int_val = get(int_b, 'Value');
            set(input_edit_ui, 'Position', [20 430 250 100]);
            pop_int = uicontrol(main_fig, "Position", [280 500 40 10]);
            pop_int.Style = 'popupmenu';
            pop_int.String = {'a'; 'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'; 'i'; 'j'; 'k'; 'l';
                       'm'; 'n'; 'o'; 'p'; 'q'; 'r'; 's';
                       't'; 'u'; 'v'; 'w'; 'x'; 'y'; 'z'};
            
            intexec_b = uicontrol(main_fig);
            intexec_b.Style = 'pushbutton';
            intexec_b.String = '∫';
            intexec_b.BackgroundColor = '#19A2F6' ;
            intexec_b.Position = [280 450 40 30];
            intexec_b.Callback = @intexecfunc;

            % Disable int
            set(int_b, 'Enable', 'off');
            set(sqrt_b, 'Enable', 'off');
            set(diff_b, 'Enable', 'off');
            set(three_plot_b, 'Enable', 'off');
        end

        function intexecfunc(~, ~)
            symvar a, symvar b, symvar c, 
            symvar d, symvar e, symvar f, 
            symvar g, symvar h, symvar i, 
            symvar j, symvar k, symvar l, 
            symvar m, symvar n, symvar o, 
            symvar p, symvar q, symvar r, 
            symvar s, symvar t, symvar u, 
            symvar v, symvar w, symvar x,
            symvar y, symvar z;
            var_strings = get(pop_int, 'String');
            i_value = get(pop_int, 'Value');
            var_value = var_strings{i_value};
            int_in = get(input_edit_ui, 'String');
            int_num = str2sym(int_in);
            int_out = int(int_num, var_value);
            int_out = string(int_out);
            set(output_edit_ui, 'String', int_out);
        end
    end

    % derivative
    function difffunc(~, ~)
        global order_edit
        global order_text
        global diffexec_b
        global pop_diff
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        if shift == 0 && shift2 == 0
            global diff_val
            diff_val = get(diff_b, 'Value');
            set(input_edit_ui, 'Position', [20 430 250 100]);
            pop_diff = uicontrol(main_fig, "Position", [291 520 40 10]);
            pop_diff.Style = 'popupmenu';
            pop_diff.String = {'a'; 'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'; 'i'; 'j'; 'k'; 'l';
                       'm'; 'n'; 'o'; 'p'; 'q'; 'r'; 's';
                       't'; 'u'; 'v'; 'w'; 'x'; 'y'; 'z'};

            order_edit = uicontrol(main_fig);
            order_edit.Style = 'edit';
            order_edit.String = '1';
            order_edit.Position = [309 470 23 20];
            
            order_text = uicontrol(main_fig);
            order_text.Style = 'text';
            order_text.String = 'order';
            order_text.FontSize = 8;
            order_text.BackgroundColor = '#D5D5D5';
            order_text.Position = [280 473 28 15];
            
            diffexec_b = uicontrol(main_fig);
            diffexec_b.Style = 'pushbutton';
            diffexec_b.String = 'd/dn';
            diffexec_b.BackgroundColor = '#19A2F6' ; % light gray
            diffexec_b.Position = [291 430 40 30];
            diffexec_b.Callback = @diffexecfunc;

            % Disable diff
            set(sqrt_b, 'Enable', 'off');
            set(int_b, 'Enable', 'off');
            set(diff_b, 'Enable', 'off');
            set(three_plot_b, 'Enable', 'off');
        end

        function diffexecfunc(~, ~)
            symvar a, symvar b, symvar c, 
            symvar d, symvar e, symvar f, 
            symvar g, symvar h, symvar i, 
            symvar j, symvar k, symvar l, 
            symvar m, symvar n, symvar o, 
            symvar p, symvar q, symvar r, 
            symvar s, symvar t, symvar u, 
            symvar v, symvar w, symvar x, 
            symvar y, symvar z;

            var_strings = get(pop_diff, 'String');
            i_value = get(pop_diff, 'Value');
            var_value = var_strings{i_value};
            order_value = get(order_edit, 'String');
            diff_in = get(input_edit_ui, 'String');
            diff_num = str2sym(diff_in);
            diff_out = diff(diff_num, var_value, order_value);
            diff_out = string(diff_out);
            set(output_edit_ui, 'String', diff_out);
        end
    end

    % csc
    function cscfunc(~, ~)
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        degrad = get(degrad_b, 'Value');
        if shift == 0 && shift2 == 0 && degrad == 0
            cscd_in = get(input_edit_ui, 'String');
            cscd_num = str2double(cscd_in);
            cscd_out = cscd(cscd_num);
            set(output_edit_ui, 'String', cscd_out);
        elseif shift == 0 && shift2 == 0 && degrad == 1
            cscr_in = get(input_edit_ui, 'String');
            cscr_num = str2double(cscr_in);
            cscr_out = csc(cscr_num);
            set(output_edit_ui, 'String', cscr_out);
        elseif shift == 1
            arccsc_in = get(input_edit_ui, 'String');
            arccsc_num = str2double(arccsc_in);
            arccsc_out = acscd(arccsc_num);
            set(output_edit_ui, 'String', arccsc_out);
        end
    end

    % sec
    function secfunc(~, ~)
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        degrad = get(degrad_b, 'Value');
        if shift == 0 && shift2 == 0 && degrad == 0
            secd_in = get(input_edit_ui, 'String');
            secd_num = str2double(secd_in);
            secd_out = secd(secd_num);
            set(output_edit_ui, 'String', secd_out);
        elseif shift == 0 && shift2 == 0 && degrad == 1
            secr_in = get(input_edit_ui, 'String');
            secr_num = str2double(secr_in);
            secr_out = sec(secr_num);
            set(output_edit_ui, 'String', secr_out);
        elseif shift == 1
            arcsec_in = get(input_edit_ui, 'String');
            arcsec_num = str2double(arcsec_in);
            arcsec_out = asecd(arcsec_num);
            set(output_edit_ui, 'String', arcsec_out);
        end
    end

    % cot
    function cotfunc(~, ~)
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        degrad = get(degrad_b, 'Value');
        if shift == 0 && shift2 == 0 && degrad == 0
            cotd_in = get(input_edit_ui, 'String');
            cotd_num = str2double(cotd_in);
            cotd_out = cotd(cotd_num);
            set(output_edit_ui, 'String', cotd_out);
        elseif shift == 0 && shift2 == 0 && degrad == 1
            cotr_in = get(input_edit_ui, 'String');
            cotr_num = str2double(cotr_in);
            cotr_out = cot(cotr_num);
            set(output_edit_ui, 'String', cotr_out);
        elseif shift == 1
            arccot_in = get(input_edit_ui, 'String');
            arccot_num = str2double(arccot_in);
            arccot_out = acotd(arccot_num);
            set(output_edit_ui, 'String', arccot_out);
        end
    end

    % laplace
    function laplacefunc(~, ~)
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        if shift == 0 && shift2 == 0
            lap_in = get(input_edit_ui, 'String');
            symvar a, symvar b, symvar c, 
            symvar d, symvar e, symvar f, 
            symvar g, symvar h, symvar i, 
            symvar j, symvar k, symvar l, 
            symvar m, symvar n, symvar o, 
            symvar p, symvar q, symvar r, 
            symvar s, symvar t, symvar u, 
            symvar v, symvar w, symvar x, 
            symvar y, symvar z;
            lap_num = str2sym(lap_in);
            lap_out = laplace(lap_num);
            lap_out = string(lap_out);
            set(output_edit_ui, 'String', lap_out);
        elseif shift == 1
            ilap_in = get(input_edit_ui, 'String');
            symvar a, symvar b, symvar c, 
            symvar d, symvar e, symvar f, 
            symvar g, symvar h, symvar i, 
            symvar j, symvar k, symvar l, 
            symvar m, symvar n, symvar o, 
            symvar p, symvar q, symvar r, 
            symvar s, symvar t, symvar u, 
            symvar v, symvar w, symvar x, 
            symvar y, symvar z;
            ilap_num = str2sym(ilap_in);
            ilap_out = laplace(ilap_num);
            ilap_out = string(ilap_out);
            set(output_edit_ui, 'String', ilap_out);
        end
    end

    % fourier
    function fourierfunc(~, ~)
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        if shift == 0 && shift2 == 0
            fourier_in = get(input_edit_ui, 'String');
            symvar a, symvar b, symvar c, 
            symvar d, symvar e, symvar f, 
            symvar g, symvar h, symvar i, 
            symvar j, symvar k, symvar l, 
            symvar m, symvar n, symvar o, 
            symvar p, symvar q, symvar r, 
            symvar s, symvar t, symvar u, 
            symvar v, symvar w, symvar x, 
            symvar y, symvar z;
            fourier_num = str2sym(fourier_in);
            fourier_out = fourier(fourier_num);
            fourier_out = string(fourier_out);
            set(output_edit_ui, 'String', fourier_out);
        end
    end
    
    % sinh
    function sinhfunc(~, ~)
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        if shift == 0 && shift2 == 0
            sinh_in = get(input_edit_ui, 'String');
            sinh_num = str2double(sinh_in);
            sinh_out = sinh(sinh_num);
            sinh_out = string(sinh_out);
            set(output_edit_ui, 'String', sinh_out);
        elseif shift == 1
            arcsinh_in = get(input_edit_ui, 'String');
            arcsinh_num = str2double(arcsinh_in);
            arcsinh_out = asinh(arcsinh_num);
            set(output_edit_ui, 'String', arcsinh_out);
        end
    end

    % cosh
    function coshfunc(~, ~)
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        if shift == 0 && shift2 == 0
            cosh_in = get(input_edit_ui, 'String');
            cosh_num = str2double(cosh_in);
            cosh_out = cosh(cosh_num);
            cosh_out = string(cosh_out);
            set(output_edit_ui, 'String', cosh_out);
        elseif shift == 1
            arccosh_in = get(input_edit_ui, 'String');
            arccosh_num = str2double(arccosh_in);
            arccosh_out = acosh(arccosh_num);
            set(output_edit_ui, 'String', arccosh_out);
        end
    end

    % tanh
    function tanhfunc(~, ~)
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        if shift == 0 && shift2 == 0
            tanh_in = get(input_edit_ui, 'String');
            tanh_num = str2double(tanh_in);
            tanh_out = tanh(tanh_num);
            tanh_out = string(tanh_out);
            set(output_edit_ui, 'String', tanh_out);
        elseif shift == 1
            arctanh_in = get(input_edit_ui, 'String');
            arctanh_num = str2double(arctanh_in);
            arctanh_out = atanh(arctanh_num);
            set(output_edit_ui, 'String', arctanh_out);
        end
    end

    % factorial
    function factfunc(~, ~)
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        if shift == 0 && shift2 == 0
            fact_in = get(input_edit_ui, 'String');
            fact_num = str2double(fact_in);
            fact_out = factorial(fact_num);
            set(output_edit_ui, 'String', fact_out);
        end
    end

    % exp
    function expfunc(~, ~)
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        if shift == 0 && shift2 == 0
            exp_in = get(input_edit_ui, 'String');
            exp_num = str2double(exp_in);
            exp_out = exp(exp_num);
            set(output_edit_ui, 'String', exp_out);
        end
    end

    % csch
    function cschfunc(~, ~)
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        if shift == 0 && shift2 == 0
            csch_in = get(input_edit_ui, 'String');
            csch_num = str2double(csch_in);
            csch_out = csch(csch_num);
            csch_out = string(csch_out);
            set(output_edit_ui, 'String', csch_out);
        elseif shift == 1
            arccsch_in = get(input_edit_ui, 'String');
            arccsch_num = str2double(arccsch_in);
            arccsch_out = acsch(arccsch_num);
            set(output_edit_ui, 'String', arccsch_out);
        end
    end

    % sech
    function sechfunc(~, ~)
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        if shift == 0 && shift2 == 0
            sech_in = get(input_edit_ui, 'String');
            sech_num = str2double(sech_in);
            sech_out = sech(sech_num);
            sech_out = string(sech_out);
            set(output_edit_ui, 'String', sech_out);
        elseif shift == 1
            arcsech_in = get(input_edit_ui, 'String');
            arcsech_num = str2double(arcsech_in);
            arcsech_out = asech(arcsech_num);
            set(output_edit_ui, 'String', arcsech_out);
        end
    end
    
    % coth
    function cothfunc(~, ~)
        shift = get(shift_b, 'Value');
        shift2 = get(shift2_b, 'Value');
        if shift == 0 && shift2 == 0
            coth_in = get(input_edit_ui, 'String');
            coth_num = str2double(coth_in);
            coth_out = coth(coth_num);
            coth_out = string(coth_out);
            set(output_edit_ui, 'String', coth_out);
        elseif shift == 1
            arccoth = get(input_edit_ui, 'String');
            arccoth_num = str2double(arccoth);
            arccoth_out = acoth(arccoth_num);
            set(output_edit_ui, 'String', arccoth_out);
        end
    end

    % 3D
    function threeplot(~, ~)
        global three_val
        global input_x_text
        global input_y_text
        global terms_t_text
        global threeplot_b
        global threeplot_fig
        global input_edit_ui2
        three_val = get(three_plot_b, 'Value');
        set(input_edit_ui, 'Position', [20 450 156 80]);
        input_edit_ui2 = uicontrol(main_fig);
        input_edit_ui2.Style = 'edit';
        input_edit_ui2.HorizontalAlignment = 'left';
        input_edit_ui2.Max = 30;
        input_edit_ui2.Min = 0;
        input_edit_ui2.FontSize = 12;
        input_edit_ui2.Position = [176 450 155 80];

        input_x_text = uicontrol(main_fig);
        input_x_text.Style = 'text';
        input_x_text.String = 'x';
        input_x_text.FontSize = 12;
        input_x_text.BackgroundColor = 'white';
        input_x_text.Position = [135 460 10 20];

        input_y_text = uicontrol(main_fig);
        input_y_text.Style = 'text';
        input_y_text.String = 'Y';
        input_y_text.FontSize = 9;
        input_y_text.BackgroundColor = 'white';
        input_y_text.Position = [290 460 10 15];

        terms_t_text = uicontrol(main_fig);
        terms_t_text.Style = 'text';
        terms_t_text.String = 't variable';
        terms_t_text.FontSize = 8;
        terms_t_text.BackgroundColor = '#D5D5D5';
        terms_t_text.ForegroundColor = 'red';
        terms_t_text.Position = [150 530 50 15];

        threeplot_b = uicontrol(main_fig);
        threeplot_b.Style = 'pushbutton';
        threeplot_b.String = '3D Plot';
        threeplot_b.BackgroundColor = '#19A2F6';
        threeplot_b.Position = [20 430 311 20];
        threeplot_b.Callback = @threeplotexec;


        % Disable
        set(int_b, 'Enable', 'off');
        set(sqrt_b, 'Enable', 'off');
        set(diff_b, 'Enable', 'off');
        set(three_plot_b, 'Enable', 'off');
        
        function threeplotexec(~, ~)
            t = [0:pi/50:10*pi];
            x_in = get(input_edit_ui, 'String');
            y_in = get(input_edit_ui2, 'String');
            x = eval(x_in);
            y = eval(y_in);
            z = t;
            threeplot_fig = figure('Name', '3D Plot', 'Resize', 'off');
            threeplot_fig.NumberTitle = 'off';
            threeplot_fig.MenuBar = 'none';
            threeplot_fig.ToolBar = 'none';
            threeplot_fig.Position = [1102 300 300 283];
            threeaxis = axes('Parent', threeplot_fig, 'Position', [0.15 0.18 0.7 0.7]);
            plot3(x, y, z, 'Parent', threeaxis);
            grid(threeaxis, 'on');
            title('3D Plot', 'Parent', threeaxis);
            xlabel('x-axis', 'Parent', threeaxis);
            ylabel('y-axis', 'Parent', threeaxis);
        end
    end
    
    % Mesh, surf, contour, meshc
    function meshplot(~, ~)
        global meshplot_fig
        [x, y] = meshgrid(-2:0.1:2);
        z = get(input_edit_ui, 'String');
        z = eval(z);
        meshplot_fig = figure('Name', 'Mesh, Surf, Contour, Mesh and Contour Plots', 'Resize', 'off');
        meshplot_fig.NumberTitle = 'off';
        meshplot_fig.Position = [1102 300 500 400];
        meshaxis = axes('Parent', meshplot_fig, 'Position', [0.15 0.18 0.7 0.7]);
        mesh(x, y, z, 'Parent', meshaxis)
        grid(meshaxis, 'on');
        title('Mesh Plot', 'Parent', meshaxis);
        xlabel('x-axis', 'Parent', meshaxis);
        ylabel('y-axis', 'Parent', meshaxis);
        zlabel('z-axis', 'Parent', meshaxis);

        meshplot_b = uicontrol(meshplot_fig);
        meshplot_b.Style = 'pushbutton';
        meshplot_b.String = 'Mesh';
        meshplot_b.Position = [10 10 50 30];
        meshplot_b.Callback = @meshplot;

        surfplot_b = uicontrol(meshplot_fig);
        surfplot_b.Style = 'pushbutton';
        surfplot_b.String = 'Surf';
        surfplot_b.Position = [65 10 50 30];
        surfplot_b.Callback = @surfplot;

        conplot_b = uicontrol(meshplot_fig);
        conplot_b.Style = 'pushbutton';
        conplot_b.String = 'Contour';
        conplot_b.Position = [120 10 50 30];
        conplot_b.Callback = @conplot;

        meshcplot_b = uicontrol(meshplot_fig);
        meshcplot_b.Style = 'pushbutton';
        meshcplot_b.String = 'Meshc';
        meshcplot_b.Position = [175 10 50 30];
        meshcplot_b.Callback = @meshcplot;

        surfeplot_b = uicontrol(meshplot_fig);
        surfeplot_b.Style = 'pushbutton';
        surfeplot_b.String = 'Surf Emp';
        surfeplot_b.Position = [230 10 50 30];
        surfeplot_b.Callback = @surfeplot;
        
        function meshplot(~, ~)
            mesh(x, y, z, 'Parent', meshaxis)
            grid(meshaxis, 'on');
            title('Mesh Plot', 'Parent', meshaxis);
            xlabel('x-axis', 'Parent', meshaxis);
            ylabel('y-axis', 'Parent', meshaxis);
            zlabel('z-axis', 'Parent', meshaxis);
        end
        function surfplot(~, ~)
            surf(x, y, z, 'Parent', meshaxis)
            grid(meshaxis, 'on');
            title('Surf Plot', 'Parent', meshaxis);
            xlabel('x-axis', 'Parent', meshaxis);
            ylabel('y-axis', 'Parent', meshaxis);
            zlabel('z-axis', 'Parent', meshaxis);
        end

        function conplot(~, ~)
            contour(x, y, z, 'Parent', meshaxis)
            grid(meshaxis, 'on');
            title('Contour Plot', 'Parent', meshaxis);
            xlabel('x-axis', 'Parent', meshaxis);
            ylabel('y-axis', 'Parent', meshaxis);
        end

        function meshcplot(~, ~)
            meshc(x, y, z, 'Parent', meshaxis)
            grid(meshaxis, 'on');
            title('Mesh and Contour Plot', 'Parent', meshaxis);
            xlabel('x-axis', 'Parent', meshaxis);
            ylabel('y-axis', 'Parent', meshaxis);
            zlabel('z-axis', 'Parent', meshaxis);
        end

        function surfeplot(~, ~)
            surf(x, y, z, 'Parent', meshaxis, 'FaceColor', 'interp', 'EdgeColor', 'flat', 'FaceLighting',...
                'phong');
            daspect([3 3 1])
            axis tight
            camlight left
            view(-50, 30)
            grid(meshaxis, 'on');
            title('Emphasized Surf Plot', 'Parent', meshaxis);
            xlabel('x-axis', 'Parent', meshaxis);
            ylabel('y-axis', 'Parent', meshaxis);
            zlabel('z-axis', 'Parent', meshaxis);
        end
    end
    
    % Sphere
    function sphereplot(~, ~)
        global sphereplot_fig
        radius = get(input_edit_ui, 'String');
        radius = str2double(radius);
        n = 60;
        [x, y, z] = sphere(n);
        x = x * radius;
        y = y * radius;
        z = z * radius;

        sphereplot_fig = figure('Name', 'Mesh and Surf Sphere Plots', 'Resize', 'off');
        sphereplot_fig.NumberTitle = 'off';
        sphereplot_fig.Position = [1102 300 500 400];
        sphereaxis = axes('Parent', sphereplot_fig, 'Position', [0.15 0.18 0.7 0.7]);
        mesh(x, y, z, 'Parent', sphereaxis)
        grid(sphereaxis, 'on');
        title('Sphere Mesh Plot', 'Parent', sphereaxis);
        xlabel('x-axis', 'Parent', sphereaxis);
        ylabel('y-axis', 'Parent', sphereaxis);
        zlabel('z-axis', 'Parent', sphereaxis);
        axis('equal');

        meshsphereplot_b = uicontrol(sphereplot_fig);
        meshsphereplot_b.Style = 'pushbutton';
        meshsphereplot_b.String = 'Mesh';
        meshsphereplot_b.Position = [10 10 50 30];
        meshsphereplot_b.Callback = @meshsphereplot;

        surfsphereplot_b = uicontrol(sphereplot_fig);
        surfsphereplot_b.Style = 'pushbutton';
        surfsphereplot_b.String = 'Surf';
        surfsphereplot_b.Position = [65 10 50 30];
        surfsphereplot_b.Callback = @surfsphereplot;

        function meshsphereplot(~, ~)
            mesh(x, y, z, 'Parent', sphereaxis)
            grid(sphereaxis, 'on');
            title('Sphere Mesh Plot', 'Parent', sphereaxis);
            xlabel('x-axis', 'Parent', sphereaxis);
            ylabel('y-axis', 'Parent', sphereaxis);
            zlabel('z-axis', 'Parent', sphereaxis);
            axis('equal')
        end

        function surfsphereplot(~, ~)
            surf(x, y, z, 'Parent', sphereaxis)
            grid(sphereaxis, 'on');
            title('Sphere Surf Plot', 'Parent', sphereaxis);
            xlabel('x-axis', 'Parent', sphereaxis);
            ylabel('y-axis', 'Parent', sphereaxis);
            zlabel('z-axis', 'Parent', sphereaxis);
            axis('equal')
        end
    end

    % Cylinder
    function cylinderplot(~, ~)
        global cylinderplot_fig
        radius = get(input_edit_ui, 'String');
        radius = str2double(radius);
        n = 30;
        [x, y, z] = cylinder(radius, n);

        cylinderplot_fig = figure('Name', 'Cylinder Surf Plot', 'Resize', 'off');
        cylinderplot_fig.NumberTitle = 'off';
        cylinderplot_fig.Position = [1102 300 500 400];
        cylinderaxis = axes('Parent', cylinderplot_fig, 'Position', [0.15 0.18 0.7 0.7]);
        surf(x, y, z, 'Parent', cylinderaxis, 'FaceColor', 'interp', 'EdgeColor', 'interp', 'FaceLighting',...
                'phong');
        daspect([5 5 1])
        axis tight
        view(-50, 30)
        camlight left
        grid(cylinderaxis, 'on');
        title('Cylinder Surf Plot', 'Parent', cylinderaxis);
        xlabel('x-axis', 'Parent', cylinderaxis);
        ylabel('y-axis', 'Parent', cylinderaxis);
        zlabel('z-axis', 'Parent', cylinderaxis);
    end
    


    % Clear function
    function clearfunc(~, ~)
        % nthroot global
        global rootn_edit_ui
        global nth_b
        global nth_text
        global root_text
        global logfig
        global root_val
        % int global
        global intexec_b
        global pop_int
        global int_val
        % diff global
        global order_edit
        global order_text
        global diffexec_b
        global pop_diff
        global diff_val
        % 3D Plot
        global input_x_text
        global input_y_text
        global terms_t_text
        global threeplot_b
        global threeplot_fig
        global input_edit_ui2
        global three_val
        % Mesh plots
        global meshplot_fig
        % Sphere plots
        global sphereplot_fig
        % Cylinder plot
        global cylinderplot_fig

        % Clear input and output
        set(input_edit_ui, 'String', '', 'Position', [20 430 311 100]);
        set(output_edit_ui, 'String', '');

        % Clear nthroot function
        if root_val == 1
            % Enable
            set(sqrt_b, 'Enable', 'on');
            set(int_b, 'Enable', 'on');
            set(diff_b, 'Enable', 'on');
            set(three_plot_b, 'Enable', 'on');
            set(rootn_edit_ui, 'Visible', 'off', 'String', '');
            set(nth_b, 'Visible', 'off');
            set(nth_text, 'Visible', 'off', 'String', '');
            set(root_text, 'Visible', 'off', 'String', '');
        end

        % Clear loglog figure
        set(logfig, 'Visible', 'off');

        % Clear indefinite integral
        if int_val == 1
            % Enable int
            set(int_b, 'Enable', 'on');
            set(sqrt_b, 'Enable', 'on');
            set(diff_b, 'Enable', 'on');
            set(three_plot_b, 'Enable', 'on');
            set(pop_int, 'Visible', 'off');
            set(intexec_b, 'Visible', 'off');
        end
        
        % Clear derivative
        if diff_val == 1
            % Enable diff
            set(sqrt_b, 'Enable', 'on');
            set(int_b, 'Enable', 'on');
            set(diff_b, 'Enable', 'on');
            set(three_plot_b, 'Enable', 'on');
            set(pop_diff, 'Visible', 'off');    
            set(order_text, 'Visible', 'off');
            set(order_edit, 'Visible', 'off');
            set(diffexec_b, 'Visible', 'off');
        end

        % Clear 3D plot
        if three_val == 1
            % Enable
            set(three_plot_b, 'Enable', 'on');
            set(sqrt_b, 'Enable', 'on');
            set(int_b, 'Enable', 'on');
            set(diff_b, 'Enable', 'on');
            set(input_edit_ui2, 'Visible', 'off');
            set(threeplot_b, 'Visible', 'off');
            set(threeplot_fig, 'Visible', 'off');
            set(input_x_text, 'Visible', 'off');
            set(input_y_text, 'Visible', 'off');
            set(terms_t_text, 'Visible', 'off');
        end

        % Clear mesh plots
        set(meshplot_fig, 'Visible', 'off');

        % Clear sphere plots
        set(sphereplot_fig, 'Visible', 'off');

        % Clear cylinder plot
        set(cylinderplot_fig, 'Visible', 'off');
    end
end