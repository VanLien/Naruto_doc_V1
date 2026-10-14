<GameFile>
  <PropertyGroup Name="homeworld_unit_info_window" Type="Layer" ID="io-nuecsf6ta47gyw2r0q1mhbdkplxv5jz39" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="background" ActionTag="-945705786" Tag="98" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" ComboBoxIndex="1" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
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
          </AbstractNodeData>
          <AbstractNodeData Name="main_container" ActionTag="1211705600" Tag="99" RotationSkewX="0" RotationSkewY="0" LeftMargin="20" RightMargin="20" TopMargin="381.5" BottomMargin="381.5" TouchEnable="True" FrameEvent="end_frame" BackColorAlpha="102" Scale9Enable="True" LeftEage="-106" RightEage="-106" TopEage="-40" BottomEage="-40" Scale9OriginX="-106" Scale9OriginY="-40" Scale9Width="204" Scale9Height="103" ctype="PanelObjectData">
            <Size Y="517" X="680" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="image_bg" ActionTag="1530920563" Tag="100" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="30" RightEage="30" TopEage="30" BottomEage="30" Scale9OriginX="30" Scale9OriginY="30" Scale9Width="34" Scale9Height="36" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="517" X="680" />
                <AnchorPoint ScaleX="0.5" ScaleY="0" />
                <Position X="340" Y="0" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1039.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="image_title" ActionTag="1930031834" Tag="101" RotationSkewX="0" RotationSkewY="0" LeftMargin="174" RightMargin="174" TopMargin="-22.434799" BottomMargin="476.434814" LeftEage="56" RightEage="56" TopEage="0" BottomEage="0" Scale9OriginX="56" Scale9OriginY="0" Scale9Width="47" Scale9Height="63" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="63" X="332" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="340" Y="507.934814" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1024.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="image_2" ActionTag="1816395032" Tag="103" RotationSkewX="0" RotationSkewY="0" LeftMargin="42.5" RightMargin="502.5" TopMargin="85" BottomMargin="298" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="134" X="135" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="110" Y="365" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="homeworld_1031.png" Plist="resource/homeworld/homeworld.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="sp_icon" ActionTag="-519102627" Tag="105" RotationSkewX="0" RotationSkewY="0" LeftMargin="87" RightMargin="547" TopMargin="129" BottomMargin="342" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="46" X="46" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="110" Y="365" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="close_btn" ActionTag="635524233" Tag="106" RotationSkewX="0" RotationSkewY="0" LeftMargin="633.499878" RightMargin="-12.4999" TopMargin="-16.5" BottomMargin="462.5" TouchEnable="True" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="29" Scale9Height="49" ShadowOffsetX="2" ShadowOffsetY="-2" ButtonText="" FontSize="14" ctype="ButtonObjectData">
                <Size Y="62" X="70" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="662.999878" Y="498" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <NormalFileData Type="PlistSubImage" Path="common_1028.png" Plist="resource/common/common.plist" />
                <PressedFileData Type="Default" Path="Default/Button_Press.png" Plist="" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                <TextColor A="255" B="70" G="65" R="65" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <FontResource />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="win_title" ActionTag="784205268" Tag="107" RotationSkewX="0" RotationSkewY="0" LeftMargin="286" RightMargin="286" TopMargin="-7.9364" BottomMargin="492.936401" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="32" X="108" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="340" Y="508.936401" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="214" G="237" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="9" G="32" R="82" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="line" ActionTag="-2062657663" Tag="129" RotationSkewX="0" RotationSkewY="0" LeftMargin="20" RightMargin="20" TopMargin="240.5" BottomMargin="273.5" LeftEage="8" RightEage="8" TopEage="0" BottomEage="0" Scale9OriginX="8" Scale9OriginY="0" Scale9Width="10" Scale9Height="3" ctype="ImageViewObjectData">
                <Size Y="3" X="640" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="340" Y="275" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1016.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="res_bg_1" ActionTag="63387303" Tag="108" RotationSkewX="0" RotationSkewY="0" LeftMargin="207.000107" RightMargin="267.999908" TopMargin="180.499695" BottomMargin="303.500305" LeftEage="7" RightEage="7" TopEage="6" BottomEage="6" Scale9OriginX="7" Scale9OriginY="6" Scale9Width="9" Scale9Height="7" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="33" X="205" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="207.000107" Y="320.000305" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1095.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="sp_res_1" ActionTag="2058861161" Tag="109" RotationSkewX="0" RotationSkewY="0" LeftMargin="208" RightMargin="434" TopMargin="182" BottomMargin="305" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="30" X="38" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="227" Y="320" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="homeworld_1021.png" Plist="resource/homeworld/homeworld.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="res_bg_2" ActionTag="1399694291" Tag="111" RotationSkewX="0" RotationSkewY="0" LeftMargin="436.000702" RightMargin="38.999298" TopMargin="180.499695" BottomMargin="303.500305" LeftEage="7" RightEage="7" TopEage="6" BottomEage="6" Scale9OriginX="7" Scale9OriginY="6" Scale9Width="9" Scale9Height="7" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="33" X="205" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="436.000702" Y="320.000305" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1095.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="sp_res_2" ActionTag="821220029" Tag="112" RotationSkewX="0" RotationSkewY="0" LeftMargin="434.5" RightMargin="202.5" TopMargin="183" BottomMargin="306" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="28" X="43" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="456" Y="320" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="homeworld_1048.png" Plist="resource/homeworld/homeworld.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="source_bg_1" ActionTag="-1581353134" Tag="76" RotationSkewX="0" RotationSkewY="0" LeftMargin="40" RightMargin="350" TopMargin="318.5" BottomMargin="151.5" LeftEage="8" RightEage="8" TopEage="6" BottomEage="6" Scale9OriginX="8" Scale9OriginY="6" Scale9Width="1" Scale9Height="1" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="47" X="290" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="185" Y="175" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="homeworld_1057.png" Plist="resource/homeworld/homeworld.plist" />
                <Children>
                  <AbstractNodeData Name="btn_go" ActionTag="-8941195" Tag="77" RotationSkewX="0" RotationSkewY="0" LeftMargin="238.5" RightMargin="0.5" TopMargin="1.5" BottomMargin="1.5" TouchEnable="True" LeftEage="16" RightEage="16" TopEage="14" BottomEage="14" Scale9OriginX="16" Scale9OriginY="14" Scale9Width="19" Scale9Height="16" ctype="ImageViewObjectData">
                    <Size Y="44" X="51" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="264" Y="23.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1015_2.png" Plist="resource/common/common.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="desc_txt" ActionTag="-1188928445" Tag="78" RotationSkewX="0" RotationSkewY="0" LeftMargin="15" RightMargin="177" TopMargin="10.5" BottomMargin="10.5" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="26" X="98" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="15" Y="23.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="35" G="50" R="100" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="20" G="90" R="196" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="source_bg_2" ActionTag="-549755327" Tag="79" RotationSkewX="0" RotationSkewY="0" LeftMargin="350" RightMargin="40" TopMargin="318.5" BottomMargin="151.5" LeftEage="8" RightEage="8" TopEage="6" BottomEage="6" Scale9OriginX="8" Scale9OriginY="6" Scale9Width="1" Scale9Height="1" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="47" X="290" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="495" Y="175" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="homeworld_1057.png" Plist="resource/homeworld/homeworld.plist" />
                <Children>
                  <AbstractNodeData Name="btn_go" ActionTag="1271950923" Tag="80" RotationSkewX="0" RotationSkewY="0" LeftMargin="238.5" RightMargin="0.5" TopMargin="1.5" BottomMargin="1.5" TouchEnable="True" LeftEage="16" RightEage="16" TopEage="14" BottomEage="14" Scale9OriginX="16" Scale9OriginY="14" Scale9Width="19" Scale9Height="16" ctype="ImageViewObjectData">
                    <Size Y="44" X="51" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="264" Y="23.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1015_2.png" Plist="resource/common/common.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="desc_txt" ActionTag="-1847847943" Tag="81" RotationSkewX="0" RotationSkewY="0" LeftMargin="15" RightMargin="177" TopMargin="10.5" BottomMargin="10.5" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="26" X="98" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="15" Y="23.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="35" G="50" R="100" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="20" G="90" R="196" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="source_bg_3" ActionTag="258125818" Tag="82" RotationSkewX="0" RotationSkewY="0" LeftMargin="40" RightMargin="350" TopMargin="398.5" BottomMargin="71.5" LeftEage="8" RightEage="8" TopEage="6" BottomEage="6" Scale9OriginX="8" Scale9OriginY="6" Scale9Width="1" Scale9Height="1" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="47" X="290" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="185" Y="95" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="homeworld_1057.png" Plist="resource/homeworld/homeworld.plist" />
                <Children>
                  <AbstractNodeData Name="btn_go" ActionTag="-154892992" Tag="83" RotationSkewX="0" RotationSkewY="0" LeftMargin="238.5" RightMargin="0.5" TopMargin="1.5" BottomMargin="1.5" TouchEnable="True" LeftEage="16" RightEage="16" TopEage="14" BottomEage="14" Scale9OriginX="16" Scale9OriginY="14" Scale9Width="19" Scale9Height="16" ctype="ImageViewObjectData">
                    <Size Y="44" X="51" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="264" Y="23.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1015_2.png" Plist="resource/common/common.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="desc_txt" ActionTag="-916568150" Tag="84" RotationSkewX="0" RotationSkewY="0" LeftMargin="15" RightMargin="177" TopMargin="10.5" BottomMargin="10.5" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="26" X="98" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="15" Y="23.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="35" G="50" R="100" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="20" G="90" R="196" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="source_bg_4" ActionTag="-397330424" Tag="85" RotationSkewX="0" RotationSkewY="0" LeftMargin="350" RightMargin="40" TopMargin="398.5" BottomMargin="71.5" LeftEage="8" RightEage="8" TopEage="6" BottomEage="6" Scale9OriginX="8" Scale9OriginY="6" Scale9Width="1" Scale9Height="1" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="47" X="290" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="495" Y="95" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="homeworld_1057.png" Plist="resource/homeworld/homeworld.plist" />
                <Children>
                  <AbstractNodeData Name="btn_go" ActionTag="-1419665131" Tag="86" RotationSkewX="0" RotationSkewY="0" LeftMargin="238.5" RightMargin="0.5" TopMargin="1.5" BottomMargin="1.5" TouchEnable="True" LeftEage="16" RightEage="16" TopEage="14" BottomEage="14" Scale9OriginX="16" Scale9OriginY="14" Scale9Width="19" Scale9Height="16" ctype="ImageViewObjectData">
                    <Size Y="44" X="51" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="264" Y="23.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1015_2.png" Plist="resource/common/common.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="desc_txt" ActionTag="464902377" Tag="87" RotationSkewX="0" RotationSkewY="0" LeftMargin="15" RightMargin="177" TopMargin="10.5" BottomMargin="10.5" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="26" X="98" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="15" Y="23.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="35" G="50" R="100" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="20" G="90" R="196" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="close_tips" ActionTag="758041383" Tag="88" RotationSkewX="0" RotationSkewY="0" LeftMargin="189" RightMargin="189" TopMargin="514" BottomMargin="-33" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="36" X="302" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="340" Y="-15" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="txt_cn_common_notice.png" Plist="resource/common/common.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="soft_label" ActionTag="-346831766" Tag="110" RotationSkewX="0" RotationSkewY="0" LeftMargin="265" RightMargin="295" TopMargin="185" BottomMargin="308" FontSize="22" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="24" X="120" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="265" Y="320" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="228" G="246" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="20" G="90" R="196" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="grid_label" ActionTag="11305739" Tag="113" RotationSkewX="0" RotationSkewY="0" LeftMargin="495" RightMargin="65" TopMargin="185" BottomMargin="308" FontSize="22" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="24" X="120" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="495" Y="320" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="228" G="246" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="20" G="90" R="196" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="num_title" ActionTag="-549370127" Tag="126" RotationSkewX="0" RotationSkewY="0" LeftMargin="40" RightMargin="541" TopMargin="269" BottomMargin="222" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="26" X="99" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="40" Y="235" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="35" G="50" R="100" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="20" G="90" R="196" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
