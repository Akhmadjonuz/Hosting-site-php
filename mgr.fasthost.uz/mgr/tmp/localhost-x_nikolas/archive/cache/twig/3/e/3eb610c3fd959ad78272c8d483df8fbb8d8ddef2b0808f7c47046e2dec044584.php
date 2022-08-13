<?php

/* @bb3mobi_MobileDevices/event/overall_footer_copyright_prepend.html */
class __TwigTemplate_3eb610c3fd959ad78272c8d483df8fbb8d8ddef2b0808f7c47046e2dec044584 extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = array(
        );
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        // line 1
        if ((isset($context["U_DEVICE_LINK"]) ? $context["U_DEVICE_LINK"] : null)) {
            // line 2
            echo "<h3>[<a href=\"";
            echo (isset($context["U_DEVICE_LINK"]) ? $context["U_DEVICE_LINK"] : null);
            echo "\">";
            echo $this->env->getExtension('phpbb')->lang("DEVICE_NAME");
            echo "</a>]</h3>
";
        }
    }

    public function getTemplateName()
    {
        return "@bb3mobi_MobileDevices/event/overall_footer_copyright_prepend.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  21 => 2,  19 => 1,);
    }
}
