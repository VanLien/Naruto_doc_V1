<GameFile>
  <PropertyGroup Name="guildboss_rank_role_panel" Type="Layer" ID="8uy35dp9-2jn71btvxsrklwiozhqfg6mec0a" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="624.000000" Y="750.000000" />
        <Children>
          <AbstractNodeData Name="top_container" ActionTag="-660144318" Tag="316" RotationSkewX="0" RotationSkewY="0" LeftMargin="8" RightMargin="8" TopMargin="0" BottomMargin="621" TouchEnable="True" BackColorAlpha="102" Scale9Enable="True" LeftEage="58" RightEage="58" TopEage="24" BottomEage="24" Scale9OriginX="58" Scale9OriginY="24" Scale9Width="18" Scale9Height="80" ctype="PanelObjectData">
            <Size Y="129" X="608" />
            <AnchorPoint ScaleX="0.5" ScaleY="1" />
            <Position X="312" Y="750" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData Type="PlistSubImage" Path="guildboss_1000.png" Plist="resource/guildboss/guildboss.plist" />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="info_container" Visible="False" ActionTag="140913861" Tag="279" RotationSkewX="0" RotationSkewY="0" LeftMargin="-1.1417" RightMargin="1.1417" TopMargin="-0.0004" BottomMargin="0.0004" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="129" X="608" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="-1.1417" Y="0.0004" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="Sprite_4" ActionTag="1763236478" Tag="278" RotationSkewX="0" RotationSkewY="0" LeftMargin="30.5" RightMargin="470.5" TopMargin="10.5" BottomMargin="11.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="107" X="107" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="84" Y="65" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="guildboss_1002.png" Plist="resource/guildboss/guildboss.plist" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="role_name" ActionTag="-897730839" Tag="382" RotationSkewX="0" RotationSkewY="0" LeftMargin="136" RightMargin="349" TopMargin="33" BottomMargin="68" FontSize="24" LabelText="---" OutlineEnabled="True" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="28" X="123" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="136" Y="82" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="9" G="9" R="139" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="check_btn" ActionTag="851717987" Tag="399" RotationSkewX="0" RotationSkewY="0" LeftMargin="399.324707" RightMargin="46.675301" TopMargin="32.5" BottomMargin="32.5" TouchEnable="True" LeftEage="30" RightEage="30" TopEage="20" BottomEage="20" Scale9OriginX="30" Scale9OriginY="20" Scale9Width="4" Scale9Height="23" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="64" X="162" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="480.324707" Y="64.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1017.png" Plist="resource/common/common.plist" />
                    <Children>
                      <AbstractNodeData Name="label" ActionTag="735385369" Tag="400" RotationSkewX="0" RotationSkewY="0" LeftMargin="31.5" RightMargin="31.5" TopMargin="16" BottomMargin="20" FontSize="24" LabelText="---" OutlineEnabled="True" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="28" X="99" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="81" Y="34" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="20" G="90" R="196" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="power_bg" ActionTag="-1947661511" Tag="401" RotationSkewX="0" RotationSkewY="0" LeftMargin="132.503494" RightMargin="284.49649" TopMargin="75" BottomMargin="22" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="32" X="191" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="228.003494" Y="38" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="mainui_1006.png" Plist="resource/mainui/mainui.plist" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="notice" ActionTag="-114983873" Tag="280" RotationSkewX="0" RotationSkewY="0" LeftMargin="237.5" RightMargin="237.5" TopMargin="54.9995" BottomMargin="46.0005" FontSize="24" LabelText="---" OutlineEnabled="True" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="28" X="133" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="304" Y="60.0005" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="9" G="9" R="139" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_1" ActionTag="-764050389" Tag="197" RotationSkewX="0" RotationSkewY="0" LeftMargin="222" RightMargin="222" TopMargin="-11.0043" BottomMargin="90.004303" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="50" X="164" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="304" Y="115.004303" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="guildboss_1001.png" Plist="resource/guildboss/guildboss.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
          <AbstractNodeData Name="container" ActionTag="1018749461" Tag="318" RotationSkewX="0" RotationSkewY="0" LeftMargin="8" RightMargin="8" TopMargin="130" BottomMargin="101" TouchEnable="True" BackColorAlpha="102" Scale9Enable="True" LeftEage="14" RightEage="14" TopEage="16" BottomEage="16" Scale9OriginX="14" Scale9OriginY="16" Scale9Width="3" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="519" X="608" />
            <AnchorPoint ScaleX="0.5" ScaleY="1" />
            <Position X="312" Y="620" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData Type="PlistSubImage" Path="common_1034.png" Plist="resource/common/common.plist" />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="Image_1" ActionTag="-1993679459" Tag="86" RotationSkewX="0" RotationSkewY="0" LeftMargin="4" RightMargin="4" TopMargin="3.2083" BottomMargin="458.791687" LeftEage="18" RightEage="18" TopEage="13" BottomEage="13" Scale9OriginX="18" Scale9OriginY="13" Scale9Width="21" Scale9Height="30" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="57" X="600" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="304" Y="487.291687" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1070.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="title_3" ActionTag="-436323723" Tag="79" RotationSkewX="0" RotationSkewY="0" LeftMargin="402" RightMargin="60" TopMargin="17.053801" BottomMargin="475.946198" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="26" X="146" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="475" Y="488.946198" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="42" G="69" R="104" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="title_2" ActionTag="1565156742" Tag="81" RotationSkewX="0" RotationSkewY="0" LeftMargin="181.078903" RightMargin="328.921112" TopMargin="17.998501" BottomMargin="475.001495" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="26" X="98" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="230.078903" Y="488.001495" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="42" G="69" R="104" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="title_1" ActionTag="1452685642" Tag="82" RotationSkewX="0" RotationSkewY="0" LeftMargin="39.394299" RightMargin="520.605713" TopMargin="17.998501" BottomMargin="475.001495" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="26" X="48" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="63.394299" Y="488.001495" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="42" G="69" R="104" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="Image_1_0_0" ActionTag="-434494975" Tag="84" RotationSkewX="0" RotationSkewY="0" LeftMargin="340.452789" RightMargin="265.547211" TopMargin="5.9985" BottomMargin="463.001495" LeftEage="0" RightEage="0" TopEage="13" BottomEage="13" Scale9OriginX="0" Scale9OriginY="13" Scale9Width="2" Scale9Height="24" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="50" X="2" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="341.452789" Y="488.001495" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1069.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="Image_1_0" ActionTag="1008971196" Tag="85" RotationSkewX="0" RotationSkewY="0" LeftMargin="121.5728" RightMargin="484.427185" TopMargin="5.9985" BottomMargin="463.001495" LeftEage="0" RightEage="0" TopEage="13" BottomEage="13" Scale9OriginX="0" Scale9OriginY="13" Scale9Width="2" Scale9Height="24" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="50" X="2" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="122.5728" Y="488.001495" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1069.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
          <AbstractNodeData Name="reward_btn" ActionTag="1081859422" Tag="172" RotationSkewX="0" RotationSkewY="0" LeftMargin="457" RightMargin="5" TopMargin="696" BottomMargin="-10" TouchEnable="True" LeftEage="17" RightEage="17" TopEage="17" BottomEage="17" Scale9OriginX="17" Scale9OriginY="17" Scale9Width="30" Scale9Height="29" Scale9Enable="True" ctype="ImageViewObjectData">
            <Size Y="64" X="162" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="538" Y="22" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData Type="PlistSubImage" Path="common_1018.png" Plist="resource/common/common.plist" />
            <Children>
              <AbstractNodeData Name="label" ActionTag="1679954188" Tag="173" RotationSkewX="0" RotationSkewY="0" LeftMargin="27" RightMargin="27" TopMargin="16" BottomMargin="16" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="32" X="108" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="81" Y="32" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="21" G="74" R="41" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
          <AbstractNodeData Name="my_rank" ActionTag="609687186" Tag="371" RotationSkewX="0" RotationSkewY="0" LeftMargin="17" RightMargin="385" TopMargin="653.075317" BottomMargin="72.924698" FontSize="22" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
            <Size Y="24" X="222" />
            <AnchorPoint ScaleX="0" ScaleY="0.5" />
            <Position X="17" Y="84.924698" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="42" G="69" R="104" />
            <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
            <OutlineColor A="255" B="0" G="0" R="255" />
            <ShadowColor A="255" B="110" G="110" R="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="my_dps" ActionTag="-121560155" Tag="373" RotationSkewX="0" RotationSkewY="0" LeftMargin="17" RightMargin="473" TopMargin="693" BottomMargin="33" FontSize="22" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
            <Size Y="24" X="134" />
            <AnchorPoint ScaleX="0" ScaleY="0.5" />
            <Position X="17" Y="45" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="42" G="69" R="104" />
            <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
            <OutlineColor A="255" B="0" G="0" R="255" />
            <ShadowColor A="255" B="110" G="110" R="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="Image_1" ActionTag="-1854959357" Tag="168" RotationSkewX="0" RotationSkewY="0" LeftMargin="164.264999" RightMargin="321.734985" TopMargin="693.5" BottomMargin="23.5" LeftEage="13" RightEage="13" TopEage="10" BottomEage="10" Scale9OriginX="13" Scale9OriginY="10" Scale9Width="3" Scale9Height="10" Scale9Enable="True" ctype="ImageViewObjectData">
            <Size Y="33" X="138" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="233.264999" Y="40" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData Type="PlistSubImage" Path="common_90003.png" Plist="resource/common/common.plist" />
          </AbstractNodeData>
          <AbstractNodeData Name="empty_tips" ActionTag="-703085026" Tag="28" RotationSkewX="0" RotationSkewY="0" LeftMargin="187" RightMargin="187" TopMargin="313.435394" BottomMargin="314.564606" LeftEage="82" RightEage="82" TopEage="40" BottomEage="40" Scale9OriginX="82" Scale9OriginY="40" Scale9Width="86" Scale9Height="42" ctype="ImageViewObjectData">
            <Size Y="122" X="250" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="312" Y="375.564606" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData Type="Normal" Path="resource/bigbg/bigbg_3.png" Plist="" />
            <Children>
              <AbstractNodeData Name="desc" ActionTag="-135831104" Tag="29" RotationSkewX="0" RotationSkewY="0" LeftMargin="20" RightMargin="20" TopMargin="120.999199" BottomMargin="-26.999201" FontSize="26" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="28" X="210" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="125" Y="-12.9992" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="42" G="69" R="104" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
          <AbstractNodeData Name="Image_1_0" ActionTag="2064400394" Tag="169" RotationSkewX="0" RotationSkewY="0" LeftMargin="162.253601" RightMargin="323.746399" TopMargin="733.5" BottomMargin="-16.5" LeftEage="13" RightEage="13" TopEage="10" BottomEage="10" Scale9OriginX="13" Scale9OriginY="10" Scale9Width="3" Scale9Height="10" Scale9Enable="True" ctype="ImageViewObjectData">
            <Size Y="33" X="138" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="231.253601" Y="0" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData Type="PlistSubImage" Path="common_90003.png" Plist="resource/common/common.plist" />
          </AbstractNodeData>
          <AbstractNodeData Name="Image_1_1" ActionTag="-1129729578" Tag="170" RotationSkewX="0" RotationSkewY="0" LeftMargin="306" RightMargin="180" TopMargin="733.5" BottomMargin="-16.5" LeftEage="13" RightEage="13" TopEage="10" BottomEage="10" Scale9OriginX="13" Scale9OriginY="10" Scale9Width="3" Scale9Height="10" Scale9Enable="True" ctype="ImageViewObjectData">
            <Size Y="33" X="138" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="375" Y="0" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData Type="PlistSubImage" Path="common_90003.png" Plist="resource/common/common.plist" />
          </AbstractNodeData>
          <AbstractNodeData Name="Image_1_2" ActionTag="-2026563580" Tag="171" RotationSkewX="0" RotationSkewY="0" LeftMargin="306" RightMargin="180" TopMargin="693.5" BottomMargin="23.5" LeftEage="13" RightEage="13" TopEage="10" BottomEage="10" Scale9OriginX="13" Scale9OriginY="10" Scale9Width="3" Scale9Height="10" Scale9Enable="True" ctype="ImageViewObjectData">
            <Size Y="33" X="138" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="375" Y="40" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData Type="PlistSubImage" Path="common_90003.png" Plist="resource/common/common.plist" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
