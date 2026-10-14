<GameFile>
  <PropertyGroup Name="action_smash_egg_panel" Type="Layer" ID="zoc2e8d7lfr0gsjmhniy6k5vw3txq9b-uap4" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="862.000000" />
        <Children>
          <AbstractNodeData Name="main_container" ActionTag="-2064872702" Tag="70" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="862" X="720" />
            <AnchorPoint ScaleX="0" ScaleY="0" />
            <Position X="0" Y="0" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="image_bg" ActionTag="-704547216" Tag="71" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="15" RightEage="15" TopEage="15" BottomEage="15" Scale9OriginX="15" Scale9OriginY="15" Scale9Width="16" Scale9Height="16" ctype="ImageViewObjectData">
                <Size Y="862" X="720" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="431" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="item_bg" ActionTag="33449656" Tag="74" RotationSkewX="0" RotationSkewY="0" LeftMargin="25.9995" RightMargin="564.000488" TopMargin="38.5042" BottomMargin="792.495789" LeftEage="7" RightEage="7" TopEage="14" BottomEage="14" Scale9OriginX="7" Scale9OriginY="14" Scale9Width="33" Scale9Height="3" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="31" X="130" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="90.999496" Y="807.995789" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1035.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="item_icon" ActionTag="1177937960" Tag="73" RotationSkewX="0" RotationSkewY="0" LeftMargin="-17.5" RightMargin="632.5" TopMargin="1.5048" BottomMargin="755.495178" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="105" X="105" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="35" Y="807.995178" />
                <Scale ScaleX="0.4" ScaleY="0.4" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Normal" Path="resource/item/37004.png" Plist="" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="add_item_btn" ActionTag="1888261115" Tag="72" RotationSkewX="0" RotationSkewY="0" LeftMargin="115.999397" RightMargin="562.00061" TopMargin="33.004799" BottomMargin="786.995178" TouchEnable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="12" Scale9Height="20" ShadowOffsetX="2" ShadowOffsetY="-2" ButtonText="" FontSize="40" ctype="ButtonObjectData">
                <Size Y="42" X="42" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="136.999405" Y="807.995178" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <NormalFileData Type="PlistSubImage" Path="common_1015.png" Plist="resource/common/common.plist" />
                <PressedFileData Type="Default" Path="Default/Button_Press.png" Plist="" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                <TextColor A="255" B="255" G="255" R="255" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="item_num_txt" ActionTag="-94407053" Tag="75" RotationSkewX="0" RotationSkewY="0" LeftMargin="75" RightMargin="629" TopMargin="37" BottomMargin="791" FontSize="26" LabelText="0" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="34" X="16" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="83" Y="808" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="213" G="255" R="254" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="0" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="btn_rule" ActionTag="1130478892" Tag="76" RotationSkewX="0" RotationSkewY="0" LeftMargin="646" RightMargin="16" TopMargin="25" BottomMargin="779" TouchEnable="True" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="28" Scale9Height="36" ShadowOffsetX="2" ShadowOffsetY="-2" ButtonText="" FontSize="14" ctype="ButtonObjectData">
                <Size Y="58" X="58" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="675" Y="808" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <NormalFileData Type="PlistSubImage" Path="common_1061.png" Plist="resource/common/common.plist" />
                <PressedFileData Type="Default" Path="Default/Button_Press.png" Plist="" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                <TextColor A="255" B="70" G="65" R="65" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <FontResource />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="title_award" ActionTag="-1875116438" Tag="77" RotationSkewX="0" RotationSkewY="0" LeftMargin="152" RightMargin="536" TopMargin="131" BottomMargin="693" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="38" X="32" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="168" Y="712" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="208" G="238" R="249" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="0" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="title_luck" ActionTag="-2077232850" Tag="78" RotationSkewX="0" RotationSkewY="0" LeftMargin="80.5" RightMargin="616.5" TopMargin="169" BottomMargin="663" FontSize="20" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="30" X="23" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="92" Y="678" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="208" G="238" R="249" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="0" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="progress_bg" ActionTag="129477697" Tag="85" RotationSkewX="0" RotationSkewY="0" LeftMargin="133.923904" RightMargin="445.076111" TopMargin="174.5" BottomMargin="668.5" LeftEage="9" RightEage="9" TopEage="7" BottomEage="7" Scale9OriginX="9" Scale9OriginY="7" Scale9Width="5" Scale9Height="5" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="19" X="141" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="133.923904" Y="678" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1095.png" Plist="resource/common/common.plist" />
                <Children>
                  <AbstractNodeData Name="progress" ActionTag="1702095264" Tag="86" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="1" BottomMargin="1" ProgressInfo="100" ctype="LoadingBarObjectData">
                    <Size Y="17" X="141" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="0" Y="9.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <ImageFileData Type="PlistSubImage" Path="common_90006.png" Plist="resource/common/common.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="progress_value" ActionTag="1216584006" Tag="87" RotationSkewX="0" RotationSkewY="0" LeftMargin="60.5" RightMargin="60.5" TopMargin="-3" BottomMargin="-3" FontSize="18" LabelText="---" OutlineEnabled="True" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="25" X="20" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="70.5" Y="9.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="208" G="238" R="249" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="0" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="sp_luck_egg" ActionTag="-265060762" Tag="88" RotationSkewX="0" RotationSkewY="0" LeftMargin="223.5" RightMargin="375.5" TopMargin="110" BottomMargin="608" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="144" X="121" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="284" Y="680" />
                <Scale ScaleX="0.25" ScaleY="0.25" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="actionsmashegg_1002.png" Plist="resource/actionsmashegg/actionsmashegg.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="award_list" ActionTag="-1755379011" Tag="89" RotationSkewX="0" RotationSkewY="0" LeftMargin="307" RightMargin="58" TopMargin="122.999901" BottomMargin="655.000122" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="84" X="355" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="307" Y="655.000122" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
              </AbstractNodeData>
              <AbstractNodeData Name="refresh_btn" ActionTag="171194270" Tag="90" RotationSkewX="0" RotationSkewY="0" LeftMargin="81" RightMargin="475" TopMargin="641.500122" BottomMargin="159.499893" TouchEnable="True" LeftEage="17" RightEage="17" TopEage="27" BottomEage="27" Scale9OriginX="17" Scale9OriginY="27" Scale9Width="30" Scale9Height="9" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="61" X="164" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="163" Y="189.999893" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1018.png" Plist="resource/common/common.plist" />
                <Children>
                  <AbstractNodeData Name="label" ActionTag="-1085287858" Tag="91" RotationSkewX="0" RotationSkewY="0" LeftMargin="64.5" RightMargin="64.5" TopMargin="9" BottomMargin="9" FontSize="30" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="43" X="35" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="82" Y="30.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="118" G="239" R="248" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="5" G="39" R="92" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="smash_all_btn" ActionTag="-38123693" Tag="95" RotationSkewX="0" RotationSkewY="0" LeftMargin="482" RightMargin="74" TopMargin="641.500122" BottomMargin="159.499893" TouchEnable="True" LeftEage="17" RightEage="17" TopEage="27" BottomEage="27" Scale9OriginX="17" Scale9OriginY="27" Scale9Width="30" Scale9Height="9" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="61" X="164" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="564" Y="189.999893" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1017.png" Plist="resource/common/common.plist" />
                <Children>
                  <AbstractNodeData Name="label" ActionTag="-1273637007" Tag="96" RotationSkewX="0" RotationSkewY="0" LeftMargin="64.5" RightMargin="64.5" TopMargin="9" BottomMargin="9" FontSize="30" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="43" X="35" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="82" Y="30.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="118" G="239" R="248" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="5" G="39" R="92" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="title_record" ActionTag="816901056" Tag="99" RotationSkewX="0" RotationSkewY="0" LeftMargin="347.5" RightMargin="347.5" TopMargin="741.5" BottomMargin="89.5" FontSize="24" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="31" X="25" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="105" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="115" G="217" R="244" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="0" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="record_more" ActionTag="-767995263" Tag="30" RotationSkewX="0" RotationSkewY="0" LeftMargin="159.983994" RightMargin="160.016006" TopMargin="740" BottomMargin="10" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="112" X="400" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="159.983994" Y="10" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
              </AbstractNodeData>
              <AbstractNodeData Name="record_list" ActionTag="74017605" Tag="100" RotationSkewX="0" RotationSkewY="0" LeftMargin="159.983994" RightMargin="160.016006" TopMargin="784" BottomMargin="10" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="68" X="400" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="159.983994" Y="10" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
              </AbstractNodeData>
              <AbstractNodeData Name="pos_node_1" ActionTag="-656002839" Tag="101" RotationSkewX="0" RotationSkewY="0" LeftMargin="140" RightMargin="580" TopMargin="387" BottomMargin="475" CallBackType="None" CallBackName="None" ctype="SingleNodeObjectData">
                <Size Y="0" X="0" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="140" Y="475" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
              </AbstractNodeData>
              <AbstractNodeData Name="pos_node_2" ActionTag="-626684452" Tag="102" RotationSkewX="0" RotationSkewY="0" LeftMargin="355" RightMargin="365" TopMargin="387" BottomMargin="475" CallBackType="None" CallBackName="None" ctype="SingleNodeObjectData">
                <Size Y="0" X="0" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="355" Y="475" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
              </AbstractNodeData>
              <AbstractNodeData Name="pos_node_3" ActionTag="1021604715" Tag="103" RotationSkewX="0" RotationSkewY="0" LeftMargin="580" RightMargin="140" TopMargin="387" BottomMargin="475" CallBackType="None" CallBackName="None" ctype="SingleNodeObjectData">
                <Size Y="0" X="0" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="580" Y="475" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
              </AbstractNodeData>
              <AbstractNodeData Name="pos_node_4" ActionTag="-1890750640" Tag="104" RotationSkewX="0" RotationSkewY="0" LeftMargin="140" RightMargin="580" TopMargin="572" BottomMargin="290" CallBackType="None" CallBackName="None" ctype="SingleNodeObjectData">
                <Size Y="0" X="0" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="140" Y="290" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
              </AbstractNodeData>
              <AbstractNodeData Name="pos_node_5" ActionTag="1592322170" Tag="105" RotationSkewX="0" RotationSkewY="0" LeftMargin="355" RightMargin="365" TopMargin="572" BottomMargin="290" CallBackType="None" CallBackName="None" ctype="SingleNodeObjectData">
                <Size Y="0" X="0" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="355" Y="290" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
              </AbstractNodeData>
              <AbstractNodeData Name="pos_node_6" ActionTag="-737069454" Tag="106" RotationSkewX="0" RotationSkewY="0" LeftMargin="580" RightMargin="140" TopMargin="572" BottomMargin="290" CallBackType="None" CallBackName="None" ctype="SingleNodeObjectData">
                <Size Y="0" X="0" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="580" Y="290" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
              </AbstractNodeData>
              <AbstractNodeData Name="time_title" ActionTag="-180622991" Tag="107" RotationSkewX="0" RotationSkewY="0" LeftMargin="564.450989" RightMargin="134.548996" TopMargin="217.807297" BottomMargin="618.192688" FontSize="20" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="26" X="21" />
                <AnchorPoint ScaleX="1" ScaleY="0.5" />
                <Position X="585.450989" Y="631.192688" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="refresh_time" ActionTag="560158617" Tag="108" RotationSkewX="0" RotationSkewY="0" LeftMargin="590.449524" RightMargin="108.550499" TopMargin="217.807297" BottomMargin="618.192688" FontSize="20" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="26" X="21" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="590.449524" Y="631.192688" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="51" G="248" R="97" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
