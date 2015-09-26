package com.spruds.meteo.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

//     var b = (Math.random().toString().substr(3, 14));
//    a += 'par=meteo' + '&lng=' + (lv ? 'lv' : 'en') + '&rnd=' + (e(LDT) ? 1 : 0) + b + (e(LDT) ? 0 : 1);

public class Main {

    public static void main(String[] args) {
        new Main().execute();
    }

    public void execute() {
        String encoded = "var a=\"645465665H636<5H6563646453646;6D6363549F:56E9G96:66E9;96:66E549F:56D6863686D6:696D66636D656:6D74:39GH5969<98:65F539F9<98:7:8:66D676<666D6463666D646D749FIE9E:69H986D676<686D64646;6D5E64635F646D676<656D6467636D859<98:7:89G:9H:9DI35F5366539G5I:65F5395:5H5:D9GH5:65369539G5I:66D855F53665I696D68636;6D6;6:6D6863646D6:68676D676<6;6D64636D676;696D5E6;5F666D676;636D5E64665F666D6D6D6863646D665F656D68636;6D6;6E9G96:66D676;636D656:6:6D66636D65666D7G949<9HHH9::6539GH59E9II5:8539794:897:D:89G:66D6769636D6663636D676D7794:89:94:9:39<9F:66D676:696D6664686D5E64666D6769676D66666:6D779<989H:99<97:59<98:7:89G:853:9H:9DI35F5367539G5I:65F5395:5H5:D9GH5:65369539G5I:66D77855F53675I696D676;666D6:6:6D676:696D6:686:6D676:666D64686D67696:6D5E64636D6768686D5E64665F646D6D6D676:696D645F656D676;666D696E9;96:66D646;696D646;656D656;6D65666D7GH59E9II5949<9H:65F5395:5HHIH9<989G53:69E949<97:59I9D9<98:66D646:686D6563686D686D779I95989F986D646:686D6565636D5E64665F656D646:656D6567656D859<98:7:89G:9H:9DI35F5368539G5I:65F5395:5H5:D9GH5:6536<539G5I:66D855F53685I6<6D646;6;6D69696D646;646D6:68696D646:6;6D65636D6469636D5E64665F646D6469636D5E64685F656D6D6D6D6D646;6;6D6:6E6D6D6D6D6D6D64646;6D686:6D6;6D7E9I9F9E946D6464686D6:656D5E64665F676D64636<6D6<676D859<98:7:89G:9H:9DI35F5369539G5I:65F5395:5H5:D9GH5:6536466539G5I:66D855F53695I64666D64656;6D69686D6465646D6:68686D6D6D6463636D5E64665F646D6463636D5E64675F696D6D6D6D6D6D6E9;96:66D65696D65636:6D656;6D65666D7GH59E9II5949<9H:65F5395:5HHIH9<989G53:69E949<97:59I9D9<98:66D64666D6566636D6<6D7F9<98:3H59D946D64686D6567686D5E64665F686D696D65696:6D779<989H:99<97:59<98:7:89G:853:9H:9DI35F536:539G5I:65F5395:5H5:D9GH5:6536465539G5I:66D77855F536:5I64656D656;6D6:696D65646D6:686:6D646;6D65636D636D5E64655F6:6D636D5E64665F6:6D6D6D6D6D656;6D6;6E9;96:66D656;696D6466656D656;6D65666D7GH59E9II5949<9H:65F5395:5HHIH9<989G53:69E949<97:59I9D9<98:66D656;636D6468686D64686D85HH9:946D656:686D646:686D5E64675F656D65696<6D646<696D779<989H:99<97:59<98:7:89G:853:9H:9DI35F5368539G5I:65F5395:5H5:D9GH5:6536;539G5I:66D77855F53685I6;6D656<666D69636D656;646D6:68696D656:6;6D64636D6569636D5E64665F6;6D6569636D5E64675F6<6D6D6D656;646D635F646D656;6;6D6;6E6D6D6D6D6D6D6463686D646<636D646;6D86949F97:8:66D6463686D6563686D5E64655F666D6463656D65656:6D859<98:7:89G:9H:9DI35F5367539G5I:65F5395:5H5:D9GH5:6536;539G5I:66D855F53675I6;6D64646;6D6:646D6464646D6:686:6D6D6D6<636D5E64645F6<6D6<636D5E64675F666D6D6D6D6D6D6E9G96:66D666:636D646<656D66636D65666D7G949<9HHH9::6539GH59E9II5:8539794:897:D:89G:66D6668686D6564686D646<6D869E:5HH:998:59<6D6669636D6566636D5E64665F656D6668676D6568656D779<989H:99<97:59<98:7:89G:853:9H:9DI35F5367539G5I:65F5395:5H5:D9GH5:6536;539G5I:66D77855F53675I6;6D666:666D69696D6669696D6:68696D6669666D65636D6667686D5E64645F6:6D6667686D5E64675F6<6D6D6D6669696D665F6:6D666:666D696E3\";function D(a){var o=\"\",i=0,n=a.length-1,r=-parseInt(a[n]);while(i<n){c=c2s(c0(a[i++],r))+c2s(c0(a[i++],r));o+=c2s(h2d(c))}return o;}var h=D(a.split(\"\"));loc=0;hy=0;$(\"mapd\").innerHTML=DD(h);h=null;";
        String payload = extractPayload(encoded);
        String decoded = decode(payload);
        String restored = restoreEncoding(decoded);

        System.out.println(restored);
        parse(restored);
    }

    private void parse(String input) {
        String[] mainParts = input.split("!");

        String dateGenerated = mainParts[1];
        System.out.println("dateGenerated: " + dateGenerated);

        String conditionsUsed = mainParts[2];
        System.out.println("conditionsUsed: " + conditionsUsed);

        String[] stations = mainParts[3].split(";");
        for(String stationData: stations) {
            String[] stationParts = stationData.split(":");

            String stationCode = stationParts[8];
            System.out.println("stationCode: " + stationCode);

            String stationName = stationParts[9];
            System.out.println("stationName: "  + stationName);

            String conditionCode = stationParts[0];
            System.out.println("conditionCode: "  + conditionCode);

            String conditionDesc = stationParts[5];
            System.out.println("conditionDesc: "  + conditionDesc);

            String temperature = stationParts[12];
            System.out.println("temperature: "  + temperature + "°C");

            String minTemperature = stationParts[24];
            System.out.println("minTemperature: "  + minTemperature + "°C");

            String maxTemperature = stationParts[26];
            System.out.println("maxTemperature: "  + maxTemperature + "°C");

            if(stationParts.length >= 32) {
                String cloudCover = stationParts[32];
                System.out.println("cloudCover: "  + cloudCover + " balles");
            }

            String wind = stationParts[16];
            System.out.println("wind: "  + wind);

            String humidity = stationParts[18];
            System.out.println("humidity: "  + humidity + "%");

            String pressure = stationParts[20];
            System.out.println("pressure: "  + pressure + "mm");

            String visibility = stationParts[22];
            System.out.println("visibility: "  + visibility + "000m");

            if(stationParts.length >= 28) {
                String snow = stationParts[28];
                System.out.println("snow: "  + snow + "cm");
            }

            if(stationParts.length >= 30) {
                String precipation = stationParts[30];
                System.out.println("precipation: "  + precipation + "mm");
            }
            System.out.println();
        }
    }

    private String extractPayload(String input) {
        String result = null;

        Pattern p = Pattern.compile("^var a=\"(.*)\";function");
        Matcher m = p.matcher(input);

        if (m.find()) {
            result = m.group(1);
        }
        return result;
    }

    private String restoreEncoding(String input) {
        String encoded = "âèçìîíïòðûþÂÍÐÛ";
        String decoded = "āčēģīķļņšūžĀĶŠŪ";

        for(int i=0; i < encoded.length(); i++) {
            String encodedChar = encoded.substring(i, i+1);
            String decodedChar = decoded.substring(i, i+1);
            
            input = input.replace(encodedChar, decodedChar);
        }
        return input;
    }

    private int getFromHex(String input) {
        return Integer.parseInt(input, 16);
    }

    private char fromCharCode(int c) {
        return (char)c;
    }

    private int getCharWithRandom(char input, int random) {
        return (int)input + random;
    }

    private String decode(String input) {
        StringBuilder output = new StringBuilder();
        int length = input.length()-1;
        int random = -Integer.valueOf(input.substring(length, length+1));

        int i= 0;
        while(i < length) {
            String firstStep = "" + fromCharCode(getCharWithRandom(input.charAt(i++), random)) +
                    fromCharCode(getCharWithRandom(input.charAt(i++), random));
            String secondStep = String.valueOf(fromCharCode(getFromHex(firstStep)));

            output.append(secondStep);
        }
        return output.toString();
    }
}

/*
     <dla ttl="Mākoņains, brīžiem skaidrosies, apledojums, lietus" />
    <dsp ttl="Mākoņains, brīžiem skaidrosies, sniegs, brīžiem sniegputenis." />

    <dsma ttl="Mākoņains, brīžiem skaidrosies, smidzinošs lietus un apledojums." />
    <dsla ttl="Mākoņains, brīžiem skaidrosies, apledojums, slapjš sniegs/ lietus ar sniegu." />
    <k ttl="Mākoņains, apmācies ar krusu." />
    <kd ttl="Mākoņains, brīžiem skaidrosies, krusa." />
    <kn ttl="Mākoņains, brīžiem skaidrosies, krusa." />
    <la ttl="Apledojums ar lietu." />
    <lk ttl="Apmācies, krusa un lietus." />
    <lkd ttl="Mākoņains, brīžiem skaidrosies, krusa, lietus." />
    <lkn ttl="Mākoņains, brīžiem skaidrosies, krusa, lietus." />

    <lmd ttl="Apmācies,  migla, lietus." />
    <lmn ttl="Mākoņains, brīžiem skaidrosies, migla, lietus." />
    <lmsa ttl="Mākoņains, brīžiem skaidrosies, migla, lietus." />
    <m ttl="Mākoņains, apmācies ar miglu." />
    <md ttl="Mākoņains, brīžiem skaidrosies dienā ar miglu." />
    <ml ttl="Mākoņains, apmācies." />
    <nla ttl="Mākoņains, brīžiem skaidrosies, apledojums, lietus." />
    <mm1 ttl="Neliels mākoņu daudzums." />
    <mm2 ttl="Neliels mākoņu daudzums." />

    <mn ttl="Mākoņains, brīžiem skaidrosies ar miglu." />
    <msa ttl="Mākoņains, apmācies ar miglu un sarmu." />
    <msad ttl="Mākoņains, brīžiem skaidrosies ar miglu un sarmu." />
    <msan ttl="Mākoņains, brīžiem skaidrosies ar miglu un sarmu." />
    <msd ttl="Mainīgs mākoņu daudzums." />
    <msi ttl="Mākoņains, brīžiem skaidrosies." />
    <msn ttl="Mākoņains, brīžiem skaidrosies." />
    <msma ttl="Mākoņains / apmācies laiks ar  smidzinošu lietu un apledojumu." />
    <mla ttl="Apmācies, apledojums, lietus" />

    <mlsa ttl="Apmācies, apledojums, slapjš sniegs/ lietus ar sniegu." />
    <msn1 ttl="Mainīgs mākoņu daudzums." />
    <n ttl="Apmācies, slapjš sniegs/sniegs ar lietu." />
    <nd ttl="Brīžiem skaidrosies, slapjš sniegs/sniegs un lietus." />
    <nl ttl="Apmācies, neliels lietus." />
    <nln ttl="Mākoņains, brīžiem skaidrosies, neliels lietus." />
    <nsma ttl="Mākoņains,  brīžiem skaidrosies, smidzinošs lietus un apledojums." />
    <nsla ttl="Mākoņains, brīžiem skaidrosies, apledojums, slapjš sniegs/ lietus ar sniegu." />
    <nm ttl="Apmācies, migla, slapjš sniegs/ lietus ar sniegu" />

    <nmd ttl="Mākoņains, brīžiem skaidrosies, migla un slapjš sniegs/ lietus ar sniegu." />
    <nmn ttl="Mākoņains, brīžiem skaidrosies, migla un slapjš sniegs/ lietus ar sniegu." />
    <nn ttl="Mākoņains, brīžiem skaidrosies, slapjš sniegs/ sniegs un lietus." />
    <nnd ttl="Mākoņains, brīžiem skaidrosies, stiprs slapjš sniegs/ sniegs ar lietu." />
    <ns ttl="Apmācies, neliels sniegs." />
    <nsld ttl="Neliels lietus, tomēr brīžiem skaidrosies." />
    <nsp ttl="Mākoņains, brīžiem skaidrosies, sniegs, brīžiem sniegputenis." />
    <nssd ttl="Mākoņains, brīžiem skaidrosies, neliels sniegs." />
    <nssn ttl="Mākoņains, brīžiem skaidrosies, neliels sniegs." />

    <pk ttl="Krusa ar pērkonu/ zibeni." />
    <sk ttl="Skaidrs un saulains." />
    <skn ttl="Skaidrs laiks." />
    <sl ttl="Apmācies, stiprs lietus." />
    <sld ttl="Stiprs lietus, brīžiem skaidrosies." />
    <sln ttl="Stiprs lietus, brīžiem skaidrosies." />
    <sm ttl="Apmācies, migla, sniegs." />
    <sma ttl="Apledojums ar smidzinošu lietu." />
    <smd ttl="Mākoņains, brīžiem skaidrosies, migla, sniegs." />

    <smn ttl="Mākoņains, brīžiem skaidrosies, migla, sniegs." />
    <snd ttl="Mākoņains, brīžiem skaidrosies, stiprs slapjš sniegs/ sniegs ar lietu" />
    <sp ttl="Sniegs, brīžiem sniegputenis." />
    <ss ttl="Apmācies, sniegs." />
    <sn ttl="Apmācies, stiprs slapjš sniegs/sniegs ar lietu." />
    <ssd ttl="Sniegs, brīžiem skaidrosies." />
    <ssn ttl="Sniegs, brīžiem skaidrosies." />
    <sts ttl="Apmācies, stiprs lietus, pērkona negaiss." />
    <stssd ttl="Mākoņains, brīžiem skaidrosies, stiprs lietus, pērkona negaiss." />

    <stssn ttl="Mākoņains, brīžiem skaidrosies, stiprs lietus, pērkona negaiss." />
    <ts ttl="Apmācies, lietus, pērkona negaiss." />
    <tsk ttl="Apmācies, lietus, pērkona negaiss, krusa." />
    <tssd ttl="Lietus, pērkona negaiss, brīžiem skaidrosies." />
    <tssdk ttl="Mākoņains, brīžiem skaidrosies, lietus, pērkona negaiss, krusa." />
    <tssn ttl="Lietus, pērkona negaiss, brīžiem skaidrosies." />
    <tssnk ttl="Mākoņains, brīžiem skaidrosies, lietus, pērkona negaiss, krusa." />
 */