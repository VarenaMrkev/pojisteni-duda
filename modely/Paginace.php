<?php
class Paginace
{
    public function urlStrany($url, $strana)
    {
        return str_replace('{strana}', $strana, $url);
    }

    public function paginace($page ,$strana, $stran, $url)
    {
        $polomer = 3; // Poloměr oblasti kolem aktuální stránky
        $html = '<nav><ul class="pagination justify-content-center"">';
        // Šipka vlevo
        if ($strana > 1)
            $html .= '<li class="page-item"><a class="page-link" href="pojistenci/'.$this->urlStrany($url, $strana - 1) . '">&laquo;</a></li>';
        else
            $html .= '<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">&laquo;</a></li>';
        $left = $strana - $polomer >= 1 ? $strana - $polomer : 1;
        $right = $strana + $polomer <= $stran ? $strana + $polomer : $stran;
        // Umístění jedničky
        if ($left > 1)
            $html .= '<li class="page-item"><a class="page-link" href="pojistenci/' . $this->urlStrany($url, 1) . '">1</a></li>';
        // Tečky vlevo
        if ($left > 2)
            $html .= '<li class="page-item disabled">&hellip;</li>';
        // Stránky v radiusu
        for ($i = $left; $i <= $right; $i++)
        {
            if ($i == $strana) // Aktivní stránka
                $html .= '<li class="page-item active"><a class="page-link" href="pojistenci/' . $this->urlStrany($url, $i) . '">' . $i . '</a</li>';
            else
                $html .= '<li class="page-item"><a class="page-link" href="pojistenci/' . $this->urlStrany($url, $i) . '">' . $i . '</a></li>';
        }
        // Tečky vpravo
        if ($right < $stran - 1)
            $html .= '<li class="page-item disabled">' . '&hellip;' . '</li>';
        // Umístění poslední stránky
        if ($right < $stran)
            $html .= '<li class="page-item"><a class="page-link" href="pojistenci/' . $this->urlStrany($url, $stran) . '">' . $stran . '</a></li>';
        // Šipka vpravo
        if ($strana < $stran)
            $html .= '<li class="page-item"><a class="page-link" href="pojistenci/' . $this->urlStrany($url, $strana + 1) . '">&raquo;</a></li>';
        else
            $html .= '<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">&raquo;</a></li>';
        $html .= '</ul></nav>';
        return $html;
    }
}