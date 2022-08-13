<?php

/* navbar_footer.html */
class __TwigTemplate_34463ebdebda90fe25ee45b547d2cda6b398e0107cd8016393dced81463e95a5 extends Twig_Template
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
        echo "<div class=\"navbar\">
<div class=\"inner\">
\t<ul id=\"nav-footer\" class=\"linklist navlinks\">
\t\t<li class=\"small-icon\">
\t\t\t";
        // line 5
        if ((isset($context["U_SITE_HOME"]) ? $context["U_SITE_HOME"] : null)) {
            echo "<a href=\"";
            echo (isset($context["U_SITE_HOME"]) ? $context["U_SITE_HOME"] : null);
            echo "\" title=\"";
            echo $this->env->getExtension('phpbb')->lang("HOME");
            echo "\"><img src=\"";
            echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
            echo "/images/icon_pages.gif\" alt=\"\" /></a>";
        }
        // line 6
        echo "\t\t\t";
        // line 7
        echo "\t\t\t<a href=\"";
        echo (isset($context["U_INDEX"]) ? $context["U_INDEX"] : null);
        echo "\" title=\"";
        echo $this->env->getExtension('phpbb')->lang("INDEX");
        echo "\"><img src=\"";
        echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
        echo "/images/icon_home.gif\" alt=\"\" /></a>
\t\t\t";
        // line 8
        // line 9
        echo "\t\t</li>
\t\t";
        // line 10
        if (((isset($context["U_WATCH_FORUM_LINK"]) ? $context["U_WATCH_FORUM_LINK"] : null) &&  !(isset($context["S_IS_BOT"]) ? $context["S_IS_BOT"] : null))) {
            // line 11
            echo "\t\t\t<li class=\"small-icon\"><a href=\"";
            echo (isset($context["U_WATCH_FORUM_LINK"]) ? $context["U_WATCH_FORUM_LINK"] : null);
            echo "\" title=\"";
            echo (isset($context["S_WATCH_FORUM_TITLE"]) ? $context["S_WATCH_FORUM_TITLE"] : null);
            echo "\"><img src=\"";
            echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
            echo "/images/icon_";
            if ( !(isset($context["S_WATCHING_FORUM"]) ? $context["S_WATCHING_FORUM"] : null)) {
                echo "unsubscribe";
            } else {
                echo "subscribe";
            }
            echo ".gif\" alt=\"\" /></a></li>
\t\t";
        }
        // line 13
        echo "\t\t";
        if ( !(isset($context["S_IS_BOT"]) ? $context["S_IS_BOT"] : null)) {
            // line 14
            echo "\t\t";
            // line 15
            echo "\t\t<li class=\"small-icon rightside\">
\t\t<a href=\"";
            // line 16
            echo (isset($context["U_DELETE_COOKIES"]) ? $context["U_DELETE_COOKIES"] : null);
            echo "\" title=\"";
            echo $this->env->getExtension('phpbb')->lang("DELETE_COOKIES");
            echo "\"><img src=\"";
            echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
            echo "/images/icon_delete_cookies.gif\" alt=\"\"/></a></li>
\t\t<li class=\"small-icon rightside\" title=\"";
            // line 17
            echo $this->env->getExtension('phpbb')->lang("FAQ");
            echo "\"><a href=\"";
            echo (isset($context["U_FAQ"]) ? $context["U_FAQ"] : null);
            echo "\"><img src=\"";
            echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
            echo "/images/icon_faq.gif\" alt=\"\"/></a></li>
\t\t";
            // line 18
            // line 19
            echo "\t\t";
        }
        // line 20
        echo "\t\t";
        if ((isset($context["S_DISPLAY_MEMBERLIST"]) ? $context["S_DISPLAY_MEMBERLIST"] : null)) {
            // line 21
            echo "\t\t<li class=\"small-icon rightside\"><a href=\"";
            echo (isset($context["U_MEMBERLIST"]) ? $context["U_MEMBERLIST"] : null);
            echo "\" title=\"";
            echo $this->env->getExtension('phpbb')->lang("MEMBERLIST");
            echo "\"><img src=\"";
            echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
            echo "/images/icon_members.gif\" alt=\"\"/></a></li>
\t\t";
        }
        // line 23
        echo "\t\t";
        // line 24
        echo "\t\t";
        if ((isset($context["U_TEAM"]) ? $context["U_TEAM"] : null)) {
            // line 25
            echo "\t\t<li class=\"small-icon rightside\"><a href=\"";
            echo (isset($context["U_TEAM"]) ? $context["U_TEAM"] : null);
            echo "\" title=\"";
            echo $this->env->getExtension('phpbb')->lang("THE_TEAM");
            echo "\"><img src=\"";
            echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
            echo "/images/icon_team.gif\" alt=\"\"/></a></li>
\t\t";
        }
        // line 27
        echo "\t\t";
        // line 28
        echo "\t\t";
        if ((isset($context["U_CONTACT_US"]) ? $context["U_CONTACT_US"] : null)) {
            // line 29
            echo "\t\t<li class=\"small-icon rightside\"><a href=\"";
            echo (isset($context["U_CONTACT_US"]) ? $context["U_CONTACT_US"] : null);
            echo "\" title=\"";
            echo $this->env->getExtension('phpbb')->lang("CONTACT_US");
            echo "\"><img src=\"";
            echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
            echo "/images/icon_contact.png\" alt=\"\" /></a></li>";
        }
        // line 30
        echo "\t</ul>
</div>
</div>
";
    }

    public function getTemplateName()
    {
        return "navbar_footer.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  138 => 30,  129 => 29,  126 => 28,  124 => 27,  114 => 25,  111 => 24,  109 => 23,  99 => 21,  96 => 20,  93 => 19,  92 => 18,  84 => 17,  76 => 16,  73 => 15,  71 => 14,  68 => 13,  52 => 11,  50 => 10,  47 => 9,  46 => 8,  37 => 7,  35 => 6,  25 => 5,  19 => 1,);
    }
}
