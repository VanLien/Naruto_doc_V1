<GameFile>
  <PropertyGroup Name="hero_library_info_window" Type="Layer" ID="drwcqb1vp-o4exl9yjifkmhgnsz2a3u60t78" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="background" ActionTag="-285421955" Tag="30" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" LeftEage="15" RightEage="15" TopEage="15" BottomEage="15" Scale9OriginX="15" Scale9OriginY="15" Scale9Width="16" Scale9Height="16" ctype="ImageViewObjectData">
            <Size Y="1280" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="main_container" ActionTag="295660810" Tag="18" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" BackColorAlpha="75" Scale9Enable="True" LeftEage="-14" RightEage="-14" TopEage="-39" BottomEage="-39" Scale9OriginX="-14" Scale9OriginY="-39" Scale9Width="28" Scale9Height="78" ctype="PanelObjectData">
            <Size Y="1280" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="0" G="0" R="0" />
            <Children>
              <AbstractNodeData Name="hero_draw_icon" ActionTag="-1263580325" Tag="21" RotationSkewX="0" RotationSkewY="0" LeftMargin="337" RightMargin="337" TopMargin="617" BottomMargin="617" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="46" X="46" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="640" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="close_btn" ActionTag="-877915179" Tag="27" RotationSkewX="0" RotationSkewY="0" LeftMargin="612.990723" RightMargin="47.0093" TopMargin="43.529999" BottomMargin="1176.469971" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="60" X="60" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="642.990723" Y="1206.469971" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="icon" ActionTag="221113402" Tag="232" RotationSkewX="0" RotationSkewY="0" LeftMargin="13" RightMargin="13" TopMargin="13" BottomMargin="13" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="62" X="70" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="30" Y="30" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1028.png" Plist="resource/common/common.plist" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="hero_name_bg" ActionTag="-1981772013" Tag="125" RotationSkewX="0" RotationSkewY="0" LeftMargin="184.451904" RightMargin="184.451904" TopMargin="41.41" BottomMargin="1196.589966" LeftEage="45" RightEage="45" TopEage="0" BottomEage="0" Scale9OriginX="45" Scale9OriginY="0" Scale9Width="1" Scale9Height="42" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="42" X="351.096191" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="1217.589966" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="hero_library_8.png" Plist="resource/herolibrary/herolibrary.plist" />
                <Children>
                  <AbstractNodeData Name="title_bg" ActionTag="-891643294" Tag="126" RotationSkewX="0" RotationSkewY="0" LeftMargin="157.548096" RightMargin="157.548096" TopMargin="50.377399" BottomMargin="-43.377399" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="35" X="36" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="175.548096" Y="-25.877399" />
                    <Scale ScaleX="6.9635" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="hero_library_16.png" Plist="resource/herolibrary/herolibrary.plist" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="hero_name" ActionTag="-492603692" Tag="29" RotationSkewX="0" RotationSkewY="0" LeftMargin="156.048096" RightMargin="156.048096" TopMargin="-2.5" BottomMargin="-2.5" FontSize="36" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="47" X="39" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="175.548096" Y="21" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="190" G="234" R="252" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="0" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="title_name" ActionTag="1271298249" Tag="31" RotationSkewX="0" RotationSkewY="0" LeftMargin="155.386993" RightMargin="165.709198" TopMargin="52.818001" BottomMargin="-44.818001" FontSize="26" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="34" X="30" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="170.386993" Y="-27.818001" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="78" G="95" R="121" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="0" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="box_6" ActionTag="-634162186" Tag="389" RotationSkewX="0" RotationSkewY="0" LeftMargin="10" RightMargin="10" TopMargin="974.440002" BottomMargin="57.16" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="248.399994" X="700" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="181.360001" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="box_6" ActionTag="-1583488853" Tag="167" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0.0009" BottomMargin="0.0008" Alpha="178" LeftEage="52" RightEage="52" TopEage="50" BottomEage="50" Scale9OriginX="52" Scale9OriginY="50" Scale9Width="13" Scale9Height="14" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="248.3983" X="700" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="350" Y="124.199997" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="hero_library_box_6.png" Plist="resource/herolibrary/herolibrary.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="encounter_btn" ActionTag="-112402006" Tag="480" RotationSkewX="0" RotationSkewY="0" LeftMargin="601.039978" RightMargin="8.96" TopMargin="-446.929993" BottomMargin="605.330017" TouchEnable="True" BackColorAlpha="102" LeftEage="-13" RightEage="-13" TopEage="-15" BottomEage="-15" Scale9OriginX="-13" Scale9OriginY="-15" Scale9Width="26" Scale9Height="30" ctype="PanelObjectData">
                    <Size Y="90" X="90" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="646.039978" Y="650.330017" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="icon" ActionTag="-1266633355" Tag="481" RotationSkewX="0" RotationSkewY="0" LeftMargin="4.5" RightMargin="4.5" TopMargin="0.558" BottomMargin="8.442" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="81" X="81" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="45" Y="48.942001" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="hero_library_23.png" Plist="resource/herolibrary/herolibrary.plist" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="label" ActionTag="675513427" Tag="482" RotationSkewX="0" RotationSkewY="0" LeftMargin="33" RightMargin="33" TopMargin="67.830002" BottomMargin="-10.83" FontSize="22" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="33" X="24" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="45" Y="5.67" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="152" G="227" R="255" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="10" G="41" R="70" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="share_btn" ActionTag="-680454262" Tag="183" RotationSkewX="0" RotationSkewY="0" LeftMargin="601.042175" RightMargin="8.9578" TopMargin="-332.930115" BottomMargin="491.330109" TouchEnable="True" BackColorAlpha="102" LeftEage="-13" RightEage="-13" TopEage="-15" BottomEage="-15" Scale9OriginX="-13" Scale9OriginY="-15" Scale9Width="26" Scale9Height="30" ctype="PanelObjectData">
                    <Size Y="90" X="90" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="646.042175" Y="536.330078" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="icon" ActionTag="-770601006" Tag="184" RotationSkewX="0" RotationSkewY="0" LeftMargin="4" RightMargin="4" TopMargin="-0.442" BottomMargin="7.442" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="83" X="82" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="45" Y="48.942001" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="hero_library_22.png" Plist="resource/herolibrary/herolibrary.plist" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="label" ActionTag="-174477576" Tag="185" RotationSkewX="0" RotationSkewY="0" LeftMargin="33" RightMargin="33" TopMargin="67.830002" BottomMargin="-10.83" FontSize="22" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="33" X="24" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="45" Y="5.67" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="152" G="227" R="255" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="10" G="41" R="70" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="attr_btn" ActionTag="1899863865" Tag="245" RotationSkewX="0" RotationSkewY="0" LeftMargin="601.042175" RightMargin="8.9578" TopMargin="-106.779999" BottomMargin="265.179993" TouchEnable="True" BackColorAlpha="102" LeftEage="-13" RightEage="-13" TopEage="-15" BottomEage="-15" Scale9OriginX="-13" Scale9OriginY="-15" Scale9Width="26" Scale9Height="30" ctype="PanelObjectData">
                    <Size Y="90" X="90" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="646.042175" Y="310.179993" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="icon" ActionTag="-1238348653" Tag="252" RotationSkewX="0" RotationSkewY="0" LeftMargin="4" RightMargin="4" TopMargin="-0.442" BottomMargin="7.442" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="83" X="82" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="45" Y="48.942001" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="hero_library_11.png" Plist="resource/herolibrary/herolibrary.plist" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="label" ActionTag="-226864950" Tag="247" RotationSkewX="0" RotationSkewY="0" LeftMargin="33" RightMargin="33" TopMargin="67.830002" BottomMargin="-10.83" FontSize="22" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="33" X="24" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="45" Y="5.67" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="152" G="227" R="255" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="10" G="41" R="70" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="story_btn" ActionTag="2105157068" Tag="127" RotationSkewX="0" RotationSkewY="0" LeftMargin="601.042114" RightMargin="8.9579" TopMargin="-219.854996" BottomMargin="378.255005" TouchEnable="True" BackColorAlpha="102" LeftEage="-13" RightEage="-13" TopEage="-15" BottomEage="-15" Scale9OriginX="-13" Scale9OriginY="-15" Scale9Width="26" Scale9Height="30" ctype="PanelObjectData">
                    <Size Y="90" X="90" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="646.042114" Y="423.255005" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="icon" ActionTag="-716859993" Tag="128" RotationSkewX="0" RotationSkewY="0" LeftMargin="4" RightMargin="4" TopMargin="-0.442" BottomMargin="7.442" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="83" X="82" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="45" Y="48.942001" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="hero_library_10.png" Plist="resource/herolibrary/herolibrary.plist" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="label" ActionTag="1153192175" Tag="129" RotationSkewX="0" RotationSkewY="0" LeftMargin="33" RightMargin="33" TopMargin="67.830002" BottomMargin="-10.83" FontSize="22" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="33" X="24" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="45" Y="5.67" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="152" G="227" R="255" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="10" G="41" R="70" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="skill_panel" Visible="False" ActionTag="-1502734984" Tag="169" RotationSkewX="0" RotationSkewY="0" LeftMargin="14.9265" RightMargin="14.9265" TopMargin="22.8295" BottomMargin="38.449299" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size Y="187.121201" X="670.146973" />
                    <AnchorPoint ScaleX="0" ScaleY="0" />
                    <Position X="14.9265" Y="38.449299" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="attr_name" ActionTag="1330269887" Tag="170" RotationSkewX="0" RotationSkewY="0" LeftMargin="116.0998" RightMargin="524.04718" TopMargin="2.9082" BottomMargin="150.212997" FontSize="26" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="34" X="30" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="131.099792" Y="167.212997" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="35" G="50" R="100" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="0" G="0" R="0" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="type_name" ActionTag="-1422290272" Tag="171" RotationSkewX="0" RotationSkewY="0" LeftMargin="481.850891" RightMargin="158.296097" TopMargin="2.9112" BottomMargin="150.210007" FontSize="26" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="34" X="30" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="496.850891" Y="167.210007" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="35" G="50" R="100" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="0" G="0" R="0" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="skill_container" ActionTag="883985633" Tag="204" RotationSkewX="0" RotationSkewY="0" LeftMargin="44.202301" RightMargin="45.944698" TopMargin="42.647202" BottomMargin="14.474" TouchEnable="True" BackColorAlpha="109" IsBounceEnabled="True" ScrollDirectionType="Vertical_Horizontal" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="ScrollViewObjectData">
                        <Size Y="130" X="580" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="334.202301" Y="79.473999" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData />
                        <FirstColor A="255" B="100" G="150" R="255" />
                        <EndColor A="255" B="255" G="255" R="255" />
                        <ColorVector ScaleX="0" ScaleY="1" />
                        <SingleColor A="255" B="100" G="150" R="255" />
                        <InnerNodeSize Height="130" Width="650" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="voice_panel" Visible="False" ActionTag="1355588608" Tag="225" RotationSkewX="0" RotationSkewY="0" LeftMargin="14.9265" RightMargin="14.9265" TopMargin="34.8312" BottomMargin="37.886799" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size Y="175.682007" X="670.146973" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0" />
                    <Position X="350" Y="37.886799" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="voice_node" ActionTag="-1163049385" Tag="240" RotationSkewX="0" RotationSkewY="0" LeftMargin="51.3745" RightMargin="618.772522" TopMargin="28.382" BottomMargin="147.300003" CallBackType="None" CallBackName="None" ctype="SingleNodeObjectData">
                        <Size Y="0" X="0" />
                        <AnchorPoint ScaleX="0" ScaleY="0" />
                        <Position X="51.3745" Y="147.300003" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="voice_btn" ActionTag="1015260471" Tag="248" RotationSkewX="0" RotationSkewY="0" LeftMargin="471.548492" RightMargin="21.667299" TopMargin="143.791595" BottomMargin="-9.661" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                        <Size Y="41.551498" X="176.931198" />
                        <AnchorPoint ScaleX="0" ScaleY="0.5" />
                        <Position X="471.548492" Y="11.1147" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData />
                        <FirstColor A="255" B="255" G="200" R="150" />
                        <EndColor A="255" B="255" G="255" R="255" />
                        <ColorVector ScaleX="0" ScaleY="1" />
                        <SingleColor A="255" B="255" G="200" R="150" />
                        <Children>
                          <AbstractNodeData Name="icon" ActionTag="-469113234" Tag="251" RotationSkewX="0" RotationSkewY="0" LeftMargin="8.3511" RightMargin="139.580093" TopMargin="3.7715" BottomMargin="3.78" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                            <Size Y="34" X="29" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <Position X="22.851101" Y="20.780001" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <CColor A="255" B="255" G="255" R="255" />
                            <FileData Type="PlistSubImage" Path="hero_library_19.png" Plist="resource/herolibrary/herolibrary.plist" />
                            <BlendFunc Dst="771" Src="1" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="icon_0" ActionTag="-1545789635" Tag="165" RotationSkewX="0" RotationSkewY="0" LeftMargin="36.774799" RightMargin="50.156399" TopMargin="29.571501" BottomMargin="5.98" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                            <Size Y="6" X="90" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <Position X="81.774803" Y="8.98" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <CColor A="255" B="255" G="255" R="255" />
                            <FileData Type="PlistSubImage" Path="hero_library_20.png" Plist="resource/herolibrary/herolibrary.plist" />
                            <BlendFunc Dst="771" Src="1" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="label" ActionTag="1609560949" Tag="250" RotationSkewX="0" RotationSkewY="0" LeftMargin="70.164902" RightMargin="82.766296" TopMargin="2.4715" BottomMargin="6.08" FontSize="22" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                            <Size Y="33" X="24" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <Position X="82.164902" Y="22.58" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <CColor A="255" B="233" G="243" R="245" />
                            <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                            <OutlineColor A="255" B="10" G="41" R="70" />
                            <ShadowColor A="255" B="110" G="110" R="110" />
                          </AbstractNodeData>
                        </Children>
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="left_btn" Visible="False" ActionTag="-2003562256" Tag="211" RotationSkewX="0" RotationSkewY="0" LeftMargin="-5.4789" RightMargin="655.478882" TopMargin="96.273804" BottomMargin="102.126198" TouchEnable="True" BackColorAlpha="102" LeftEage="-13" RightEage="-13" TopEage="-15" BottomEage="-15" Scale9OriginX="-13" Scale9OriginY="-15" Scale9Width="26" Scale9Height="30" ctype="PanelObjectData">
                    <Size Y="50" X="50" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="19.521099" Y="127.126198" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="icon" ActionTag="418243905" Tag="212" RotationSkewX="0" RotationSkewY="0" LeftMargin="-4.39" RightMargin="23.389999" TopMargin="-1.02" BottomMargin="-4.98" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="56" X="31" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="11.11" Y="23.02" />
                        <Scale ScaleX="-1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="common_90034.png" Plist="resource/common/common.plist" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="right_btn" Visible="False" ActionTag="-1341595294" Tag="214" RotationSkewX="0" RotationSkewY="0" LeftMargin="652.896606" RightMargin="-2.8966" TopMargin="95.445" BottomMargin="102.955002" TouchEnable="True" BackColorAlpha="102" LeftEage="-13" RightEage="-13" TopEage="-15" BottomEage="-15" Scale9OriginX="-13" Scale9OriginY="-15" Scale9Width="26" Scale9Height="30" ctype="PanelObjectData">
                    <Size Y="50" X="50" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="677.896606" Y="127.955002" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="icon" ActionTag="402143539" Tag="215" RotationSkewX="0" RotationSkewY="0" LeftMargin="23.65" RightMargin="-4.65" TopMargin="-1.02" BottomMargin="-4.98" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="56" X="31" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="39.150002" Y="23.02" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="common_90034.png" Plist="resource/common/common.plist" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="score_image" ActionTag="1080256434" Tag="205" RotationSkewX="0" RotationSkewY="0" LeftMargin="523.723511" RightMargin="76.276497" TopMargin="143.556793" BottomMargin="1031.443237" LeftEage="39" RightEage="39" TopEage="34" BottomEage="34" Scale9OriginX="39" Scale9OriginY="34" Scale9Width="4" Scale9Height="37" ctype="ImageViewObjectData">
                <Size Y="105" X="120" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="583.723511" Y="1083.943237" />
                <Scale ScaleX="0.85" ScaleY="0.85" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="partnersummon_s.png" Plist="resource/partnersummon/partnersummon.plist" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
